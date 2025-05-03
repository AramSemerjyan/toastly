import 'package:flutter/material.dart';

enum ToastAnimationType {
  fade,
  slideUp,
  slideDown,
  scaleIn,
}

enum ToastlyStackMode {
  /// default: Replace previous toast with new one
  replace,

  /// Queue all toasts and show them one after another
  queue,
}

/// The interface that defines the configurable properties of a toast in [Toastly].
abstract class ToastlyConfigInterface {
  /// The main widget displayed in the toast.
  ///
  /// This is typically a [Text] widget, but can be any custom content.
  Widget get message;

  /// The alignment of the toast on the screen.
  ///
  /// Defaults to [Alignment.bottomCenter].
  Alignment get alignment;

  /// Whether the toast should automatically dismiss after a duration.
  ///
  /// Defaults to `true`.
  bool get autoDismiss;

  /// An optional widget displayed before the [message], typically an icon.
  Widget? get icon;

  /// The background color of the toast container.
  Color? get backgroundColor;

  /// Padding around the toast container.
  EdgeInsetsGeometry? get padding;

  /// Elevation (shadow) of the toast container.
  double? get elevation;

  /// A widget displayed for manually dismissing the toast.
  ///
  /// Only used when [autoDismiss] is `false`.
  Widget? get closeItem;

  /// The number of seconds to wait before dismissing the toast.
  ///
  /// Only applies if [autoDismiss] is `true`.
  int? get dismissInSeconds;

  /// The border radius of the toast container.
  BorderRadius? get borderRadius;

  /// Whether to show a progress bar indicating time until dismissal.
  ///
  /// Only applies if [autoDismiss] is `true`.
  bool get shouldShowProgressBar;

  /// Color of the progress bar.
  Color? get progressBarColor;

  /// Height of the progress bar.
  double? get progressBarHeight;

  /// Alignment of the progress bar inside the toast container.
  Alignment? get progressBarAlignment;

  /// The animation style used when showing and hiding the toast.
  ///
  /// Defaults to [ToastAnimationType.scaleIn].
  ToastAnimationType get animationType;
}

class ToastlyConfig implements ToastlyConfigInterface {
  @override
  final Widget message;
  @override
  final Alignment alignment;
  @override
  final bool autoDismiss;
  @override
  final Widget? icon;
  @override
  final Color? backgroundColor;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  double? elevation;
  @override
  Widget? closeItem;
  @override
  int? dismissInSeconds;
  @override
  BorderRadius? borderRadius;
  @override
  bool shouldShowProgressBar;
  @override
  Color? progressBarColor;
  @override
  double? progressBarHeight;
  @override
  Alignment? progressBarAlignment;
  @override
  ToastAnimationType animationType;

  ToastlyConfig({
    required this.message,
    this.animationType = ToastAnimationType.scaleIn,
    this.autoDismiss = true,
    this.shouldShowProgressBar = false,
    this.alignment = Alignment.bottomCenter,
    this.icon,
    this.backgroundColor,
    this.padding,
    this.elevation,
    this.closeItem,
    this.dismissInSeconds,
    this.borderRadius,
    this.progressBarColor,
    this.progressBarHeight,
    this.progressBarAlignment,
  });
}
