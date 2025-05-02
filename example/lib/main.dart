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

  void _showToast(ToastlyConfig config) {
    _toastly.show(
      config: config,
      context: context,
      onToastTap: () {
        _toastly.hide();
      },
    );
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
      appBar: AppBar(title: const Text('Toastly Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _button('Basic Toast', () {
              _showToast(ToastlyConfig(
                message: const Text('Hello from Toastly!'),
              ));
            }),
            _button('Custom Icon', () {
              _showToast(ToastlyConfig(
                message: const Text('Saved successfully'),
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ));
            }),
            _button('Top Aligned', () {
              _showToast(ToastlyConfig(
                message: const Text('This appears at the top'),
                alignment: Alignment.topCenter,
              ));
            }),
            _button('Persistent with Close Item', () {
              _showToast(ToastlyConfig(
                autoDismiss: false,
                message: const Text('Manually dismiss me'),
                closeItem: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _toastly.hide();
                  },
                ),
              ));
            }),
            _button('Custom Duration (5s)', () {
              _showToast(ToastlyConfig(
                message: const Text('Will dismiss in 5 seconds'),
                dismissInSeconds: 5,
              ));
            }),
            _button('Custom Border Radius', () {
              _showToast(ToastlyConfig(
                message: const Text('Rounded corners!'),
                borderRadius: BorderRadius.circular(40),
              ));
            }),
            _button('Fully Styled Toast', () {
              _showToast(
                ToastlyConfig(
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.deepPurple,
                  ),
                  message: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Custom Design',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  type: ToastAnimationType.slideUp,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  backgroundColor: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(16),
                  dismissInSeconds: 4,
                  shouldShowProgressBar: true,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
