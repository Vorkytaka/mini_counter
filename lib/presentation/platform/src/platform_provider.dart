import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformProvider extends InheritedWidget {
  final TargetPlatform targetPlatform;

  const PlatformProvider({
    super.key,
    required this.targetPlatform,
    required super.child,
  });

  @override
  bool updateShouldNotify(PlatformProvider oldWidget) =>
      targetPlatform != oldWidget.targetPlatform;

  static TargetPlatform of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<PlatformProvider>()!;
    return widget.targetPlatform;
  }
}

class PlatformProviderHolder extends StatefulWidget {
  final Widget child;

  const PlatformProviderHolder({
    required this.child,
    super.key,
  });

  @override
  State<PlatformProviderHolder> createState() => _PlatformProviderHolderState();

  static void setTargetPlatform(BuildContext context, TargetPlatform platform) {
    final state =
        context.findAncestorStateOfType<_PlatformProviderHolderState>()!;
    state.setPlatform(platform);
  }
}

class _PlatformProviderHolderState extends State<PlatformProviderHolder> {
  TargetPlatform? _selectedPlatform;

  void setPlatform(TargetPlatform platform) => setState(() {
        _selectedPlatform = platform;
      });

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      targetPlatform: _selectedPlatform ?? defaultTargetPlatform,
      child: widget.child,
    );
  }
}
