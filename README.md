## 🥯 toastly

A lightweight, customizable toast overlay for Flutter apps — perfect for displaying quick feedback messages with optional icons, custom styling, and manual dismiss options.

---

## ✨ Features

- 🔹 Fully customizable toast content using any `Widget`
- 🔹 Manual or auto-dismiss behavior
- 🔹 Custom alignment
- 🔹 Configurable padding, colors, border radius, and elevation
- 🔹 Tap callback support

---

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  toastly: ^0.0.1
```

## 🛠️ Usage
## 1. Initialize once with an animation controller

```dart
late final _animationController = AnimationController(
  duration: const Duration(seconds: 1),
  vsync: this,
);
late final Toastly _toastly = Toastly(animationController: _animationController);
```

## 2. Show a toast

```dart
toast.show(
  context: context,
  config: ToastlyConfig(
    message: const Text('Post saved!'),
    icon: const Icon(Icons.check_circle, color: Colors.green),
    alignment: Alignment.bottomCenter,
    autoDismiss: true,
    backgroundColor: Colors.white,
  ),
);
```

| Field | Type | Description |
| --- | --- | --- |
| message |	Widget |	Main toast content |
| icon |	Widget? |	Optional leading icon |
| alignment |	Alignment	Toast | position (top, bottom, etc.) |
| padding |	EdgeInsetsGeometry? |	Outer toast padding |
| backgroundColor |	Color? |	Toast background |
| elevation |	double? |	Shadow elevation |
| autoDismiss |	bool |	Whether to auto-dismiss |
| dismissInSeconds |	int? |	How long before auto-dismiss |
| closeItem |	Widget? |	Custom close button (top-right) |
| borderRadius |	BorderRadius? |	Corner roundness |

## 🧪 Example App
## Check out the example/ folder for a complete working demo.
