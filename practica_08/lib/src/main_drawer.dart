import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.orange,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                    'https://tse1.explicit.bing.net/th/id/OIP.eGft3KQhToqhx58StR7_fwAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 5.0),
                Text(
                  'Britney Sanchez',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Estudiante',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.person, color: Colors.black),
          title: const Text('Perfil'),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.inbox, color: Colors.black),
          title: const Text('Mensajería'),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.assessment, color: Colors.black),
          title: const Text('Dashboard'),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.settings, color: Colors.black),
          title: const Text('Configuración'),
        ),
        const SizedBox(height: 20.0),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.exit_to_app, color: Colors.black),
          title: const Text('Salir'),
        ),
      ],
    );
  }
}
