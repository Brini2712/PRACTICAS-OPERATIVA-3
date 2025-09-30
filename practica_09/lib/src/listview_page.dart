import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  final List<String> tipos = [
    'Normal',
    'Fighting',
    'Flying',
    'Poison',
    'Ground',
    'Rock',
    'Bug',
    'Ghost',
    'Steel',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Psychic',
    'Ice',
    'Dragon',
    'Dark',
    'Fairy',
    'Unknown',
    'Shadow',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 09 - Pokédex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: tipos.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 0.0,
            ),
            title: Text(tipos[index]),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(
                'data:image/png;base64,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',
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          );
        },
      ),
    );
  }
}
