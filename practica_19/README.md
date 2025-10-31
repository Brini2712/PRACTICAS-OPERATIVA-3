# practica_19

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Práctica 19 – Estructura inicial

Se creó la estructura solicitada en el PDF:

- Carpeta `assets/` (registrada en `pubspec.yaml`).
- Carpeta `lib/src/` con archivos:
	- `listview.dart`
	- `details_page.dart`
	- `pdf_preview.dart`
- Carpeta `lib/ui/` con archivos:
	- `details_container.dart`
	- `head_container.dart`
	- `list_tile.dart`

Además, se dejó el archivo `lib/main.dart` vacío según el paso indicado.

Siguiente paso: añadir el GIF dentro de `assets/` y continuar con la implementación de navegación, detalles y vista previa de PDF según el PDF de la práctica.

### Paquetes añadidos en `pubspec.yaml`

- http: ^0.13.3
- pdf: ^3.6.2
- path_provider: ^2.0.5
- printing: ^5.6.2
- image_downloader: ^0.30.0

Assets registrados:

- `assets/`
- `assets/progress.gif` (archivo de marcador de posición; reemplázalo por tu GIF real)
