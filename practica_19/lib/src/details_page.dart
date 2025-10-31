import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:practica_19/src/pdf_preview.dart';
import 'package:practica_19/ui/details_container.dart';
import 'package:practica_19/ui/head_container.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  var datosName;
  var datosGender;
  var datosImage;
  String? _path;

  DetailsPage({
    super.key,
    required this.datosName,
    required this.datosGender,
    required this.datosImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$datosName - Details'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF422C),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeadContainer(imagerec: datosImage),
              const SizedBox(height: 12),
              MyDetailContainer(nom: datosName, sexo: datosGender),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF422C),
        child: const Icon(Icons.print_outlined),
        onPressed: () async {
          await _downloadImage();
          Future.delayed(const Duration(milliseconds: 3000), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfPage(
                  nombre: datosName,
                  genero: datosGender,
                  imagenurl: _path,
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Future<void> _downloadImage() async {
    try {
      final imageId = await ImageDownloader.downloadImage(datosImage);
      if (imageId != null) {
        _path = await ImageDownloader.findPath(imageId);
        // ignore: avoid_print
        print('imagen descargada: $_path');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
