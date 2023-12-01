import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dependency.dart';
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
    return ListView(
      children: [
        PlatformAppBar(
          title: Text("Settings"),
          trailing: PlatformIconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.done),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: context.watch<Dependencies>().compactModeSetting,
          builder: (context, isCompact, _) {
            return PlatformListTile(
              title: Text("Compact UI"),
              trailing: PlatformSwitch(
                value: isCompact ?? false,
                onChanged: (enable) {
                  context.read<Dependencies>().compactModeSetting.set(enable);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
