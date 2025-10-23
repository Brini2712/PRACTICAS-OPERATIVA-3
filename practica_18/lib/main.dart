import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/table_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Practica 18',
      debugShowCheckedModeBanner: false,
      home: TablePage(),
    );
  }
}
