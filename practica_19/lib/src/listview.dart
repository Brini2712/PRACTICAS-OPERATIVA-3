import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practica_19/ui/list_tile.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 19 - API'),
        centerTitle: true,
        backgroundColor: const Color(0xFF3F51B5),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _llamarURL(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final data = snapshot.data ?? [];
          try {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final datos = data[index] as Map<String, dynamic>;
                final nombre = datos['name']?.toString() ?? 'Sin nombre';
                final genero = datos['gender']?.toString() ?? 'Desconocido';
                final imagen = datos['image']?.toString() ?? '';
                return MyListTile(
                  titulo: nombre,
                  subtitulo: genero,
                  imagenfin: imagen,
                );
              },
            );
          } catch (exc) {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<dynamic>> _llamarURL() async {
    const url =
        'https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,20,183';
    final respuesta = await http.get(Uri.parse(url));
    final respuestaJson = json.decode(respuesta.body);
    // La API regresa una lista para múltiples ids
    return respuestaJson as List<dynamic>;
  }
}
