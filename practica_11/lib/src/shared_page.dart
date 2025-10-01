import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPage extends StatefulWidget {
  const SharedPage({super.key});

  @override
  State<SharedPage> createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  int _edad = 0;
  String _nombre = '';

  Future<void> _grabarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('edad', 24);
    await prefs.setString('nombre', 'Britney Sanchez');
  }

  Future<void> _leerDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _edad = prefs.getInt('edad') ?? 0;
      _nombre = prefs.getString('nombre') ?? '';
    });
  }

  @override
  void initState() {
    _grabarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 11'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $_nombre'),
            const SizedBox(height: 15),
            Text('Edad: $_edad'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _grabarDatos();
            _leerDatos();
          });
        },
        tooltip: 'Refrescar',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
