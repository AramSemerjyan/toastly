import 'dart:async';

import 'package:flutter/material.dart';

import 'toastly_config.dart';

class Toastly {
  final AnimationController animationController;
  late final Animation<double> animation =
      CurveTween(curve: Curves.fastOutSlowIn).animate(animationController);
  OverlayEntry? _currentOverlayEntry;
  Timer? _timer;

  Toastly({required this.animationController}) {
    animationController.duration = const Duration(milliseconds: 300);
    animationController.reverseDuration = const Duration(milliseconds: 300);
  }

  void show({
    required ToastlyConfig config,
    required BuildContext context,
    VoidCallback? onToastTap,
  }) {
    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;

    _currentOverlayEntry = _buildOverlay(
      config,
      onToastTap: onToastTap,
    );

    Overlay.of(context).insert(_currentOverlayEntry!);
    animationController.reset();
    animationController.forward();

    if (config.autoDismiss) {
      _setTimer(config);
    } else {
      _timer?.cancel();
    }
  }

  void hide() {
    _timer?.cancel();
    _removeOverlay();
  }

  void _removeOverlay() {
    animationController.reverse().whenComplete(() {
      _currentOverlayEntry?.remove();
      _currentOverlayEntry = null;
    });
  }

  void _setTimer(ToastlyConfig config) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: config.dismissInSeconds ?? 2), () {
      _removeOverlay();
    });
  }

  Widget _buildCloseItem(ToastlyConfig config) {
    return config.closeItem ??
        IconButton(
          onPressed: hide,
          icon: Icon(Icons.close),
        );
  }

  OverlayEntry _buildOverlay(ToastlyConfig config, {VoidCallback? onToastTap}) {
    return OverlayEntry(
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: config.padding ?? const EdgeInsets.all(20),
            child: Align(
              alignment: config.alignment,
              child: FadeTransition(
                opacity: animation,
                child: Material(
                  borderRadius:
                      config.borderRadius ?? BorderRadius.circular(20),
                  elevation: config.backgroundColor == Colors.transparent
                      ? 0
                      : (config.elevation ?? 2),
                  color: config.backgroundColor ?? Colors.white,
                  child: GestureDetector(
                    onTap: onToastTap,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (config.icon != null) config.icon!,
                          if (config.icon != null) const SizedBox(width: 8),
                          config.message,
                          if (!config.autoDismiss) _buildCloseItem(config),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
