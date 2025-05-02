import 'package:flutter/material.dart';
import 'package:toastly/toastly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Toastly Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Toastly _toastly =
      Toastly(animationController: _animationController);

  @override
  void initState() {
    super.initState();
  }

  void _show(ToastlyConfig config) {
    _toastly.show(context: context, config: config);
  }

  Widget _button(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toastly Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _button('Fade Animation (default)', () {
              _show(ToastlyConfig(
                message: const Text('This is a fade toast'),
                type: ToastAnimationType.fade,
              ));
            }),
            _button('Slide Up Animation', () {
              _show(ToastlyConfig(
                message: const Text('Sliding up!'),
                type: ToastAnimationType.slideUp,
              ));
            }),
            _button('Slide Down Animation', () {
              _show(ToastlyConfig(
                message: const Text('Sliding down!'),
                alignment: Alignment.topCenter,
                type: ToastAnimationType.slideDown,
              ));
            }),
            _button('Scale Animation (default)', () {
              _show(ToastlyConfig(
                message: const Text('Pop in!'),
                type: ToastAnimationType.scaleIn,
              ));
            }),
            _button('With Icon and Progress Bar', () {
              _show(ToastlyConfig(
                message: const Text('Saving...'),
                icon: const Icon(Icons.download),
                shouldShowProgressBar: true,
                progressBarColor: Colors.blueAccent,
                type: ToastAnimationType.slideUp,
                dismissInSeconds: 4,
              ));
            }),
            _button('Persistent with Close Button', () {
              _show(ToastlyConfig(
                message: const Text('This won’t auto-dismiss'),
                autoDismiss: false,
                closeItem: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => _toastly.hide(),
                ),
                backgroundColor: Colors.orange[50],
                type: ToastAnimationType.scaleIn,
              ));
            }),
            _button('Fully Styled Toast', () {
              _show(ToastlyConfig(
                icon: const Icon(Icons.info_outline, color: Colors.deepPurple),
                message: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Styled Toast',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Multiline, icon, bar, and animation.'),
                  ],
                ),
                backgroundColor: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shouldShowProgressBar: true,
                progressBarColor: Colors.deepPurple,
                dismissInSeconds: 5,
                type: ToastAnimationType.slideDown,
                alignment: Alignment.topCenter,
              ));
            }),
          ],
        ),
      ),
    );
  }
}
