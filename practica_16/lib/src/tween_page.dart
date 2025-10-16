import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({Key? key}) : super(key: key);

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> {
  double _font = 25;

  final Tween<double> _escalaTween = Tween<double>(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween'), centerTitle: true),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: _escalaTween,
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 1800),
          builder: (BuildContext context, double escala, Widget? hijo) {
            return Transform.scale(scale: escala, child: hijo);
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.orangeAccent,
            child: Center(
              child: Text(
                'HOLA',
                style: TextStyle(fontSize: _font, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
