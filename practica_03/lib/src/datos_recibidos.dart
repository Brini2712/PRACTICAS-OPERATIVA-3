import 'package:flutter/material.dart';

class DatosRecibidos extends StatelessWidget {
  final String? datos;

  const DatosRecibidos({super.key, this.datos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Recibidos'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.data_usage, size: 64, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                'Datos Mostrados:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  datos ?? 'No hay datos disponibles',
                  style: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  String texto;
  String sexo;

  Data({required this.texto, required this.sexo});
}

class DatosPage extends StatelessWidget {
  final Data data;
  const DatosPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Recibidos'),
        centerTitle: true,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Los datos son:'),
            Text('Nombre: ${data.texto}'),
            Text('Sexo: ${data.sexo}'),
          ],
        ), // Column
      ), // Center
    ); // Scaffold
  }
}
