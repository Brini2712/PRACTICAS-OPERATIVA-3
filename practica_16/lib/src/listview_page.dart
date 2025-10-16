import 'package:flutter/material.dart';
import 'animated_page.dart';
import 'tween_page.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 16 - Animaciones'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Animaciones'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnimatedPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tween'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TweenPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
