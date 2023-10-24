import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/database/database.dart';
import '../dependency.dart';
import 'intl/generated/l10n.dart';
import 'upsert_counter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    final s = S.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        trailing: CupertinoButton(
          onPressed: () {
            showUpsertCounterSheet(context: context);
          },
          padding: EdgeInsets.zero,
          child: const Icon(Icons.add),
        ),
        middle: Text(s.main_page__title),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      child: const CounterList(),
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
    final database = dependencies.database;

    _subscription = database.getCountersIds.listen((ids) {
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
      return const SizedBox.shrink();
    }

    return ListView.separated(
      itemCount: ids.length,
      separatorBuilder: (context, i) =>
          Divider(color: CupertinoColors.separator.darkColor),
      itemBuilder: (context, i) => CounterWidget(
        id: ids[i],
        key: ValueKey(ids[i]),
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
    final database = dependencies.database;

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
          CupertinoButton(
            onPressed: () {
              database.decrement(id);
              SystemSound.play(SystemSoundType.click);
              HapticFeedback.lightImpact();
            },
            child: const Icon(
              Icons.remove,
              size: 36,
            ),
          ),
          Expanded(
            child: CounterCenterWidget(
              id: id,
            ),
          ),
          CupertinoButton(
            onPressed: () {
              database.increment(id);
              SystemSound.play(SystemSoundType.click);
              HapticFeedback.lightImpact();
            },
            child: const Icon(
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
    final database = dependencies.database;

    return StreamBuilder<Counter>(
      stream: database.counter(id),
      builder: (context, snapshot) {
        final counter = snapshot.data;

        if (counter == null) {
          return const SizedBox.shrink();
        }

        final title = counter.title;

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
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w200,
                  ),
                  child: Text('${counter.value}'),
                ),
              ),
              if (title != null)
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white54,
                  ),
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
  }
}
