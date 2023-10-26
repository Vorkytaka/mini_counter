import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database/database.dart';
import '../dependency.dart';
import 'intl/generated/l10n.dart';
import 'platform/platform_ui.dart';

Future<void> showUpsertCounterSheet({
  required BuildContext context,
  Counter? counter,
}) =>
    showPlatformBottomSheet(
      context: context,
      builder: (context) => UpsertCounterPage(
        counter: counter,
      ),
    );

class UpsertCounterPage extends StatefulWidget {
  final Counter? counter;

  const UpsertCounterPage({
    this.counter,
    super.key,
  });

  @override
  State<UpsertCounterPage> createState() => _UpsertCounterPageState();
}

class _UpsertCounterPageState extends State<UpsertCounterPage> {
  late final _controller = TextEditingController();
  bool _negativeEnabled = true;
  int _step = 1;

  @override
  void initState() {
    super.initState();

    final counter = widget.counter;
    if (counter != null) {
      _controller.text = counter.title ?? '';
      _negativeEnabled = counter.negative;
      _step = counter.step;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ListView(
      physics: const ScrollPhysics(),
      children: [
        PlatformAppBar(
          leading: PlatformIconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.close),
          ),
          title: widget.counter != null
              ? Text(s.upsert_page__title__change)
              : Text(s.upsert_page__title__add),
          trailing: PlatformIconButton(
            padding: EdgeInsets.zero,
            onPressed: _upsert,
            icon: const Icon(Icons.done),
          ),
        ),
        const SizedBox(height: 16),
        PlatformListTileGroup(
          children: [
            _titleTextField(context),
            PlatformListTile(
              title: Text(s.upsert_page__hint_step),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle.merge(
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Text('$_step'),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.secondarySystemFill.darkColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            if (_step > 1) {
                              setState(() {
                                _step -= 1;
                              });
                            }
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          minSize: 44 - 16,
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(
                          height: 18,
                          child: VerticalDivider(
                            color: CupertinoColors.lightBackgroundGray,
                            width: 1,
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              _step += 1;
                            });
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          minSize: 44 - 16,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PlatformListTile(
              onTap: () => setState(() {
                _negativeEnabled = !_negativeEnabled;
              }),
              title: Text(s.upsert_page__hint_negative),
              trailing: PlatformSwitch(
                value: _negativeEnabled,
                onChanged: (enable) => setState(() {
                  _negativeEnabled = enable;
                }),
              ),
            ),
          ],
        ),
        if (widget.counter != null)
          PlatformListTileGroup(
            children: [
              PlatformListTile(
                onTap: () {
                  _confirmDialog(
                    context: context,
                    title: s.reset_confirm__title,
                    cancel: s.common__cancel,
                    confirm: s.reset_confirm__confirm,
                  ).then((value) {
                    if (value) {
                      final dependencies = context.read<Dependencies>();
                      final database = dependencies.database;

                      database
                          .resetCounter(widget.counter!.id)
                          .then((_) => Navigator.of(context).pop());
                    }
                  });
                },
                title: Text(s.upsert_page__hint_reset),
              ),
              PlatformListTile(
                onTap: () {
                  _confirmDialog(
                    context: context,
                    title: s.delete_confirm__title,
                    cancel: s.common__cancel,
                    confirm: s.delete_confirm__confirm,
                  ).then((value) async {
                    if (value) {
                      final dependencies = context.read<Dependencies>();
                      final database = dependencies.database;

                      database
                          .deleteCounter(widget.counter!.id)
                          .then((_) => Navigator.of(context).pop());
                    }
                  });
                },
                title: Text(
                  s.upsert_page__hint_delete,
                  style: const TextStyle(
                    color: CupertinoColors.destructiveRed,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _titleTextField(BuildContext context) {
    final s = S.of(context);
    final platform = PlatformProvider.of(context);

    if (platform.isCupertino) {
      return SizedBox(
        height: 44,
        child: CupertinoTextField(
          maxLines: 1,
          controller: _controller,
          textAlign: TextAlign.end,
          decoration: const BoxDecoration(),
          autofocus: true,
          prefix: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(s.upsert_page__hint_title),
          ),
          clearButtonMode: OverlayVisibilityMode.editing,
          textCapitalization: TextCapitalization.sentences,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          maxLines: 1,
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
            label: Text(s.upsert_page__hint_title),
            // border: InputBorder.none,
          ),
        ),
      );
    }
  }

  void _upsert() {
    final dependencies = context.read<Dependencies>();
    final database = dependencies.database;
    final title = _controller.text.isEmpty ? null : _controller.text;

    if (widget.counter != null) {
      database.updateCounter(
        widget.counter!.id,
        title: title,
        negative: _negativeEnabled,
        step: _step,
      );
    } else {
      database.createCounter(title, _negativeEnabled, _step);
    }

    Navigator.of(context).pop();
  }
}

Future<bool> _confirmDialog({
  required BuildContext context,
  required String title,
  required String cancel,
  required String confirm,
}) =>
    showPlatformDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text(title),
          actions: [
            PlatformDialogAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancel),
            ),
            PlatformDialogAction(
              onPressed: () => Navigator.of(context).pop(true),
              isDefaultAction: true,
              textStyle: const TextStyle(
                color: CupertinoColors.destructiveRed,
              ),
              child: Text(confirm),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
