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
                'https://cdn-icons-png.flaticon.com/512/188/188918.png',
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
