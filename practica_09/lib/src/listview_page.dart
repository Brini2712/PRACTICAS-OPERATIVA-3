import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 09 - Pokédex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
              bottom: 0.0,
            ),
            title: Text('Normal'),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(
                'https://image.flaticon.com/icons/png/512/188/188918.png',
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
