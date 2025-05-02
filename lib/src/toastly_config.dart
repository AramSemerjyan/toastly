import 'package:flutter/material.dart';

abstract class ToastlyConfigInterface {
  Widget get message;
  Alignment get alignment;
  bool get autoDismiss;
  Widget? get icon;
  Color? get backgroundColor;
  EdgeInsetsGeometry? get padding;
  double? get elevation;
  Widget? get closeItem;
  int? get dismissInSeconds;
  BorderRadius? get borderRadius;
  bool get shouldShowProgressBar;
  Color? get progressBarColor;
  double? get progressBarHeight;
  Alignment? get progressBarAlignment;
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

  ToastlyConfig({
    required this.message,
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
