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

![Screen Recording 2025-05-03 at 00 48 55](https://github.com/user-attachments/assets/181d8c1f-1aa9-40a0-a61e-b43418517736)

| Field                   | Type                  | Description                                                |
| ----------------------- | --------------------- | ---------------------------------------------------------- |
| `message`               | `Widget`              | Main toast content                                         |
| `icon`                  | `Widget?`             | Optional leading icon                                      |
| `alignment`             | `Alignment`           | Toast position (top, bottom, center, etc.)                 |
| `padding`               | `EdgeInsetsGeometry?` | Outer padding of the toast                                 |
| `backgroundColor`       | `Color?`              | Toast background color                                     |
| `elevation`             | `double?`             | Shadow elevation beneath the toast                         |
| `autoDismiss`           | `bool`                | Whether the toast dismisses automatically                  |
| `dismissInSeconds`      | `int?`                | Number of seconds before dismiss (if enabled)              |
| `closeItem`             | `Widget?`             | Custom close button (top-right corner)                     |
| `borderRadius`          | `BorderRadius?`       | Corner rounding of the toast                               |
| `type`                  | `ToastAnimationType`  | Toast animation: `fade`, `slideUp`, `slideDown`, `scaleIn` |
| `shouldShowProgressBar` | `bool`                | Whether to show animated progress bar                      |
| `progressBarColor`      | `Color?`              | Color of the progress bar (if shown)                       |
| `progressBarHeight`     | `double?`             | Height of the progress bar                                 |
| `progressBarAlignment`  | `Alignment?`          | Alignment of the progress bar inside the toast             |


## 🧪 Example App
## Check out the example/ folder for a complete working demo.
