import 'package:flutter/material.dart';
import 'package:practica_03/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ctrlnom = TextEditingController();
  final data = Data(texto: '', sexo: '');
  int _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Practica 03'),
        centerTitle: true,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlnom,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre',
                contentPadding: EdgeInsets.all(20),
              ), // InputDecoration
            ), // TextField
            SizedBox(height: 20),
            DropdownButton(
              value: _valor,
              items: [
                DropdownMenuItem(value: 1, child: Text('Mujer')),
                DropdownMenuItem(value: 2, child: Text('Hombre')),
              ],
              onChanged: (selected) {
                setState(() {
                  _valor = selected!;
                });
              },
            ), // DropdownButton
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[200],
                foregroundColor: Colors.white,
              ),
              child: Text('Enviar'),
              onPressed: () {
                setState(() {
                  data.texto = ctrlnom.text;
                  if (_valor == 1) {
                    data.sexo = 'Mujer';
                  } else {
                    data.sexo = 'Hombre';
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DatosPage(data: data),
                    ),
                  );
                });
              },
            ), // ElevatedButton
          ],
        ),
      ),
    );
  }
}
