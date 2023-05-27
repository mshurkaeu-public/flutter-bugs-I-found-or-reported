import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const String appTitle =
    'newlines are eaten after WidgetSpan in Android browser';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  const _MyHomePage();

  static const double _boxSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'line 1. Before WidgetSpan(${_boxSize}x$_boxSize). Two newlines in the end.\n\n',
              ),
              WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  height: _boxSize,
                  width: _boxSize,
                ),
              ),
              const TextSpan(
                text: '\n\nline 2. After the WidgetSpan(${_boxSize}x$_boxSize). Two newlines in the beginning, two newlines in the end.\n\n',
              ),
              const TextSpan(
                text: 'line 3. Before WidgetSpan(Row). Two newlines in the end.\n\n',
              ),
              WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  height: _boxSize,
                  child: const Row(),
                ),
              ),
              const TextSpan(
                text: '\n\nline 4. After the WidgetSpan(Row). Two newlines in the beginning.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
