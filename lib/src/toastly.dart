import 'dart:async';

import 'package:flutter/material.dart';

import 'toastly_config.dart';

class Toastly {
  final AnimationController animationController;
  late final Animation<double> animation =
      CurveTween(curve: Curves.fastOutSlowIn).animate(animationController);
  OverlayEntry? _currentOverlayEntry;
  Timer? _timer;

  VoidCallback? onDismiss;

  Toastly({required this.animationController}) {
    animationController.duration = const Duration(milliseconds: 300);
    animationController.reverseDuration = const Duration(milliseconds: 300);
  }

  void show({
    required ToastlyConfig config,
    required BuildContext context,
    VoidCallback? onToastTap,
    VoidCallback? onDismiss,
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

    this.onDismiss = onDismiss;
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
      onDismiss?.call();
      onDismiss = null;
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

  Widget _buildProgressBar(ToastlyConfig config) {
    return Positioned.fill(
      child: Align(
        alignment: config.progressBarAlignment ?? Alignment.bottomLeft,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 1.0, end: 0.0),
          duration: Duration(seconds: config.dismissInSeconds ?? 2),
          builder: (context, value, child) {
            return FractionallySizedBox(
              widthFactor: value,
              child: Container(
                height: config.progressBarHeight ?? 4,
                decoration: BoxDecoration(
                  color: (config.progressBarColor ?? Colors.black)
                      .withOpacity(0.1),
                  borderRadius:
                      config.borderRadius ?? BorderRadius.circular(20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAnimatedToast({
    required Widget child,
    required Animation<double> animation,
    required ToastAnimationType animationType,
  }) {
    switch (animationType) {
      case ToastAnimationType.fade:
        return FadeTransition(
          opacity: animation,
          child: child,
        );

      case ToastAnimationType.slideUp:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 2),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

      case ToastAnimationType.slideDown:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -2),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

      case ToastAnimationType.scaleIn:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
    }
  }

  OverlayEntry _buildOverlay(ToastlyConfig config, {VoidCallback? onToastTap}) {
    return OverlayEntry(
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: config.padding ?? const EdgeInsets.all(20),
            child: Align(
              alignment: config.alignment,
              child: _buildAnimatedToast(
                animationType: config.type,
                animation: animation,
                child: Material(
                  borderRadius:
                      config.borderRadius ?? BorderRadius.circular(20),
                  elevation: config.backgroundColor == Colors.transparent
                      ? 0
                      : (config.elevation ?? 2),
                  color: config.backgroundColor ?? Colors.white,
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      GestureDetector(
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
                      if (config.autoDismiss && config.shouldShowProgressBar)
                        _buildProgressBar(config),
                    ],
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
