import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dependency.dart';
import 'intl/generated/l10n.dart';
import 'platform/platform_ui.dart';

Future<void> showSettingsBottomSheet({
  required BuildContext context,
}) =>
    showPlatformBottomSheet(
      context: context,
      builder: (context) => const SettingsPage(),
    );

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ListView(
      children: [
        PlatformAppBar(
          title: Text(s.settings_page__title),
          trailing: PlatformIconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.done),
          ),
        ),
        PlatformListTileGroup(children: [
          ValueListenableBuilder(
            valueListenable: context.watch<Dependencies>().compactModeSetting,
            builder: (context, isCompact, _) {
              return PlatformListTile(
                title: Text(s.settings_page__compact_ui),
                trailing: PlatformSwitch(
                  value: isCompact ?? false,
                  onChanged: (enable) {
                    context.read<Dependencies>().compactModeSetting.set(enable);
                  },
                ),
              );
            },
          ),
        ]),
      ],
    );
  }
}
