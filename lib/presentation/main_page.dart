import 'dart:async';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/database/database.dart';
import '../dependency.dart';
import 'intl/generated/l10n.dart';
import 'platform/platform_ui.dart';
import 'settings_page.dart';
import 'upsert_counter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final mediaQuery = MediaQuery.of(context);

    final platform = PlatformProvider.of(context);

    final Widget? iosAction;
    final Widget? androidAction;

    final Widget? iosSettingsAction;
    final Widget? androidSettingsAction;
    if (platform.isCupertino) {
      iosAction = PlatformIconButton(
        onPressed: () => showUpsertCounterSheet(context: context),
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.add),
      );
      iosSettingsAction = const _SettingsAction();
      androidAction = null;
      androidSettingsAction = null;
    } else {
      iosAction = null;
      iosSettingsAction = null;
      androidAction = FloatingActionButton(
        onPressed: () => showUpsertCounterSheet(context: context),
        child: const Icon(Icons.add),
      );
      androidSettingsAction = const _SettingsAction();
    }

    double bottomPadding = mediaQuery.padding.bottom;
    if (!platform.isCupertino) {
      bottomPadding += 56 + 16;
    }

    return PlatformScaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: androidAction,
      body: CustomScrollView(
        slivers: [
          PlatformSliverAppBar(
            leading: iosSettingsAction,
            actions: [
              if (iosAction != null) iosAction,
              if (androidSettingsAction != null) androidSettingsAction,
            ],
            title: SelectPlatformWidget(
              child: Text(s.main_page__title),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            sliver: const CounterList(),
          ),
        ],
      ),
    );
  }
}

class _SettingsAction extends StatelessWidget {
  const _SettingsAction();

  @override
  Widget build(BuildContext context) {
    final platform = PlatformProvider.of(context);

    final EdgeInsets? edgeInsets =
        platform.isCupertino ? EdgeInsets.zero : null;

    return PlatformIconButton(
      icon: const Icon(Icons.settings_outlined),
      padding: edgeInsets,
      onPressed: () {
        showSettingsBottomSheet(context: context);
      },
    );
  }
}

class SelectPlatformWidget extends StatefulWidget {
  final Widget child;

  const SelectPlatformWidget({
    required this.child,
    super.key,
  });

  @override
  State<SelectPlatformWidget> createState() => _SelectPlatformWidgetState();
}

class _SelectPlatformWidgetState extends State<SelectPlatformWidget> {
  int _taps = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _taps += 1;
        if (_taps >= 3) {
          showPlatformDialog<TargetPlatform>(
            context: context,
            builder: (context) => PlatformAlertDialog(
              title: const Text('Select the platform'),
              actions: [
                PlatformDialogAction(
                  onPressed: () =>
                      Navigator.of(context).pop(TargetPlatform.iOS),
                  child: const Text('iOS'),
                ),
                PlatformDialogAction(
                  onPressed: () =>
                      Navigator.of(context).pop(TargetPlatform.android),
                  child: const Text('Android'),
                ),
              ],
            ),
          ).then((platform) {
            if (platform != null) {
              PlatformProviderHolder.setTargetPlatform(context, platform);
            }
          });
        }
      },
      child: widget.child,
    );
  }
}

class CounterList extends StatefulWidget {
  const CounterList({super.key});

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
  StreamSubscription? _subscription;
  List<String>? _ids;

  final _collectionEquality = const DeepCollectionEquality();

  @override
  void initState() {
    super.initState();

    final dependencies = context.read<Dependencies>();
    final repository = dependencies.repository;

    _subscription = repository.getCountersIds.listen((ids) {
      if (!_collectionEquality.equals(_ids, ids)) {
        setState(() {
          _ids = ids;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ids = _ids;
    if (ids == null) {
      return const SliverToBoxAdapter();
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final int itemIndex = index ~/ 2;

          if (index.isEven) {
            return CounterWidget(id: ids[itemIndex]);
          }

          return const Divider(height: 1, color: Color(0xFF424242));
        },
        semanticIndexCallback: (Widget widget, int localIndex) {
          if (localIndex.isEven) {
            return localIndex ~/ 2;
          }
          return null;
        },
        childCount: max(0, ids.length * 2 - 1),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final String id;

  const CounterWidget({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dependencies = context.read<Dependencies>();
    final repository = dependencies.repository;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlatformIconButton(
            onPressed: () {
              repository.decrement(id);
              SystemSound.play(SystemSoundType.click);
              HapticFeedback.lightImpact();
            },
            icon: const Icon(
              Icons.remove,
              size: 36,
            ),
          ),
          Expanded(
            child: CounterCenterWidget(
              id: id,
            ),
          ),
          PlatformIconButton(
            onPressed: () {
              repository.increment(id);
              SystemSound.play(SystemSoundType.click);
              HapticFeedback.lightImpact();
            },
            icon: const Icon(
              Icons.add,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}

class CounterCenterWidget extends StatelessWidget {
  final String id;

  const CounterCenterWidget({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dependencies = context.read<Dependencies>();
    final repository = dependencies.repository;

    return StreamBuilder<Counter>(
      stream: repository.counter(id),
      builder: (context, snapshot) {
        final counter = snapshot.data;

        if (counter == null) {
          return const SizedBox.shrink();
        }

        final title = counter.title;

        return ValueListenableBuilder(
          valueListenable: context.watch<Dependencies>().compactModeSetting,
          builder: (context, isCompact, _) {
            final TextStyle numberStyle;
            final TextStyle subtitleStyle;
            if (isCompact ?? true) {
              numberStyle = const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w400,
              );
              subtitleStyle = const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              );
            } else {
              numberStyle = const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w200,
              );
              subtitleStyle = const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              );
            }

            return GestureDetector(
              onTap: () {
                showUpsertCounterSheet(
                  context: context,
                  counter: counter,
                );
              },
              child: Column(
                children: [
                  FittedBox(
                    child: DefaultTextStyle.merge(
                      style: numberStyle,
                      child: Text('${counter.value}'),
                    ),
                  ),
                  if (title != null)
                    DefaultTextStyle.merge(
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      child: Text(title),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
