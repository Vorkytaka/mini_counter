import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../data/database/database.dart';
import '../dependency.dart';
import 'intl/generated/l10n.dart';

Future<void> showUpsertCounterSheet({
  required BuildContext context,
  Counter? counter,
}) =>
    CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      expand: true,
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
        CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.of(context).maybePop(),
            child: const Icon(Icons.close),
          ),
          middle: widget.counter != null
              ? Text(s.upsert_page__title__change)
              : Text(s.upsert_page__title__add),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _upsert,
            child: const Icon(Icons.done),
          ),
        ),
        const SizedBox(height: 16),
        CupertinoListSection.insetGrouped(
          backgroundColor: Colors.transparent,
          children: [
            SizedBox(
              height: 44,
              child: CupertinoTextField(
                maxLines: 1,
                controller: _controller,
                textAlign: TextAlign.end,
                decoration: const BoxDecoration(),
                autofocus: true,
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(s.upsert_page__hint_title),
                ),
                clearButtonMode: OverlayVisibilityMode.editing,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            CupertinoListTile(
              title: Text(s.upsert_page__hint_step),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$_step'),
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
            CupertinoListTile(
              onTap: () => setState(() {
                _negativeEnabled = !_negativeEnabled;
              }),
              title: Text(s.upsert_page__hint_negative),
              trailing: Switch.adaptive(
                value: _negativeEnabled,
                onChanged: (enable) => setState(() {
                  _negativeEnabled = enable;
                }),
              ),
            ),
          ],
        ),
        if (widget.counter != null)
          CupertinoListSection.insetGrouped(
            backgroundColor: Colors.transparent,
            children: [
              CupertinoListTile(
                onTap: () {
                  _confirmDeleteDialog(context: context).then((value) async {
                    if (value) {
                      final dependencies = context.read<Dependencies>();
                      final database = dependencies.database;

                      await database
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

Future<bool> _confirmDeleteDialog({
  required BuildContext context,
}) =>
    showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final s = S.of(context);

        return CupertinoAlertDialog(
          title: Text(s.delete_confirm__title),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(s.delete_confirm__cancel),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(true),
              isDefaultAction: true,
              textStyle: const TextStyle(
                color: CupertinoColors.destructiveRed,
              ),
              child: Text(s.delete_confirm__delete),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
