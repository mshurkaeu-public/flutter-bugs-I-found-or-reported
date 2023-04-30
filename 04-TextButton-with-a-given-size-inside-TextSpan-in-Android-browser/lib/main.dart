import 'package:flutter/material.dart';

const String title =
    'TextButton with a given size inside TextSpan in Android browser';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String fontFamily = DefaultTextStyle.of(context).style.fontFamily ?? 'null';

    Size testTextSize;
    TextPainter textPainter = TextPainter(
      text: const TextSpan(text: 'Test text'),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    try {
      textPainter.layout();
      testTextSize = textPainter.size;
    } finally {
      textPainter.dispose();
    }

    double iconSize = testTextSize.height;
    
    ButtonStyle buttonStyle = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      // by default the minimumSize is Size(64, 36)
      // check documentation of the method
      // ButtonStyle defaultStyleOf(BuildContext context)
      // in
      // ~snap/flutter/common/flutter/packages/flutter/lib/src/material/text_button.dart
      minimumSize: const Size(1, 1),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: 'Default font family is $fontFamily\n\n',
            children: [
              const TextSpan(
                text: 'This is the bug manifistation:\n',
              ),
              TextSpan(
                text: 'Line above a TextButton, which is $iconSize×$iconSize\n',
              ),
              const TextSpan(
                text: 'text before the button →',
              ),
              WidgetSpan(
                child: TextButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: Icon(
                    Icons.copy,
                    size: iconSize,
                  ),
                ),
              ),
              const TextSpan(
                text: '← text after the button\n',
              ),
              const TextSpan(
                text: 'line below the button (bla-bla-bla, bla-bla-bla)\n',
              ),
              const TextSpan(
                text: '\n\n',
              ),


              const TextSpan(
                text: 'This is my workaround:\n',
              ),
              TextSpan(
                text: 'Line above a SizedBox, which is $iconSize×$iconSize\n',
              ),
              const TextSpan(
                text: 'text before the sized box →',
              ),
              WidgetSpan(
                child: SizedBox(
                  height: iconSize,
                  width: iconSize,
                  child: TextButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: Icon(
                    Icons.copy,
                    size: iconSize,
                  ),
                ),
                ),
              ),
              const TextSpan(
                text: '← text after the sized box\n',
              ),
              const TextSpan(
                text: 'line below the sized box (bla-bla-bla, bla-bla-bla)\n',
              ),
              const TextSpan(
                text: '\n\n',
              ),

              const TextSpan(
                text: 'For a reference:\n',
              ),
              const TextSpan(
                text: 'Line above a TextButton, which is 64×36\n',
              ),
              const TextSpan(
                text: 'text before the button →',
              ),
              WidgetSpan(
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.copy,
                    size: iconSize,
                  ),
                ),
              ),
              const TextSpan(
                text: '← text after the button\n',
              ),
              const TextSpan(
                text: 'line below the button (bla-bla-bla, bla-bla-bla)\n',
              ),
              const TextSpan(
                text: '\n\n',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
