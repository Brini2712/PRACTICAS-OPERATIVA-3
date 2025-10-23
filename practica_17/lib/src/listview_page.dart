import 'package:flutter/material.dart';
import '../data/movies.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  late List<Map<String, dynamic>> pelis;

  @override
  void initState() {
    super.initState();
    pelis = [...movies];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];
          return Dismissible(
            key: ValueKey(item['id']),
            background: Container(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.library_add, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Agregar', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.cancel_outlined, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Eliminar', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              // Left to right -> agregar, right to left -> eliminar
              if (direction == DismissDirection.startToEnd) {
                // Agregar action (no eliminar)
                handleAction(index, 'Agregar', remove: false);
                return false; // keep the item
              } else {
                // Eliminar action
                return true; // allow dismiss and remove
              }
            },
            onDismissed: (direction) {
              handleAction(index, 'Eliminar', remove: true);
            },
            child: ListTile(
              leading: SizedBox(
                width: 56,
                height: 56,
                child: Image.network(
                  item['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => const Icon(Icons.broken_image),
                ),
              ),
              title: Text(item['title_name'] ?? ''),
              subtitle: Text(item['genre'] ?? ''),
              trailing: null,
            ),
          );
        },
      ),
    );
  }

  void onDismissed(int index, String accion) {
    setState(() {
      final snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void handleAction(int index, String accion, {required bool remove}) {
    setState(() {
      final snackBar = SnackBar(content: Text('Accion: $accion'));
      if (remove) {
        // Ensure index is in range before removing
        if (index >= 0 && index < pelis.length) pelis.removeAt(index);
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
