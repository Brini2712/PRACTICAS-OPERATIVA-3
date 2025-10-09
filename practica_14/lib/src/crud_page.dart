import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late Database database;
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'practica14.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT)',
        );
      },
      version: 1,
    );
    _loadItems();
  }

  Future<void> _loadItems() async {
    final List<Map<String, dynamic>> maps = await database.query('items');
    setState(() {
      items = maps;
    });
  }

  Future<void> _insertItem(String name, String description) async {
    await database.insert('items', {
      'name': name,
      'description': description,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    _loadItems();
  }

  Future<void> _updateItem(int id, String name, String description) async {
    await database.update(
      'items',
      {'name': name, 'description': description},
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadItems();
  }

  Future<void> _deleteItem(int id) async {
    await database.delete('items', where: 'id = ?', whereArgs: [id]);
    _loadItems();
  }

  void _showInsertDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Insertar Elemento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  _insertItem(nameController.text, descriptionController.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Insertar'),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(Map<String, dynamic> item) {
    TextEditingController nameController = TextEditingController(
      text: item['name'],
    );
    TextEditingController descriptionController = TextEditingController(
      text: item['description'],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Actualizar Elemento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  _updateItem(
                    item['id'],
                    nameController.text,
                    descriptionController.text,
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Actualizar'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Eliminar Elemento'),
          content: Text(
            '¿Estás seguro de que quieres eliminar "${item['name']}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteItem(item['id']);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Eliminar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 14 - SQLite'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _showInsertDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'INSERT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: items.isNotEmpty
                        ? () => _showDeleteDialog(items.last)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'REMOVE',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: items.isNotEmpty
                        ? () => _showUpdateDialog(items.last)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'UPDATE',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loadItems,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'SHOW',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    title: Text(item['name'] ?? 'Sin nombre'),
                    subtitle: Text(item['description'] ?? 'Sin descripción'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showUpdateDialog(item),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _showDeleteDialog(item),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
