import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 18 - orientación'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          // You can uncomment and adjust columnWidths if desired
          // columnWidths: {0: FractionColumnWidth(.5)},
          children: const [
            TableRow(
              children: [RectangleLarge(), RectangleMedium(), RectangleSmall()],
            ),
            TableRow(
              children: [RectangleSmall(), RectangleLarge(), RectangleMedium()],
            ),
            TableRow(
              children: [RectangleMedium(), RectangleSmall(), RectangleLarge()],
            ),
            TableRow(
              children: [RectangleLarge(), RectangleMedium(), RectangleSmall()],
            ),
          ],
        ),
      ),
    );
  }
}

class RectangleLarge extends StatelessWidget {
  const RectangleLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Colors.red),
    );
  }
}

class RectangleMedium extends StatelessWidget {
  const RectangleMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Colors.green),
    );
  }
}

class RectangleSmall extends StatelessWidget {
  const RectangleSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Colors.yellow),
    );
  }
}
