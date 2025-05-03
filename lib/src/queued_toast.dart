import 'package:flutter/material.dart';

import '../toastly.dart';

class QueuedToast {
  final ToastlyConfig config;
  final BuildContext context;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  QueuedToast({
    required this.config,
    required this.context,
    this.onTap,
    this.onDismiss,
  });
}
