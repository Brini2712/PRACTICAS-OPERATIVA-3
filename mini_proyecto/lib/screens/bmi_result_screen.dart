import 'package:flutter/material.dart';
import 'splash_screen.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmi;
  final double weight;
  final double height;

  const BMIResultScreen({
    super.key,
    required this.bmi,
    required this.weight,
    required this.height,
  });

  String _getBMICategory(double bmi) {
    if (bmi < 18) {
      return 'Peso Bajo';
    } else if (bmi >= 18 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 27) {
      return 'Obesidad';
    } else if (bmi >= 27 && bmi < 30) {
      return 'Obesidad Grado I';
    } else if (bmi >= 30 && bmi < 40) {
      return 'Obesidad Grado II';
    } else {
      return 'Obesidad Grado III';
    }
  }

  String _getBMIDescription(double bmi) {
    if (bmi < 18) {
      return 'Necesario valorar signos de desnutrición';
    } else if (bmi >= 18 && bmi < 25) {
      return 'Peso saludable';
    } else if (bmi >= 25 && bmi < 27) {
      return 'Riesgo de obesidad';
    } else if (bmi >= 27 && bmi < 30) {
      return 'Riesgo relativo para desarrollar enfermedades cardiovasculares';
    } else if (bmi >= 30 && bmi < 40) {
      return 'Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares';
    } else {
      return 'Riesgo relativo extremadamente alto para el desarrollo de enfermedades cardiovasculares';
    }
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18) {
      return Colors.orange;
    } else if (bmi >= 18 && bmi < 25) {
      return Colors.green;
    } else if (bmi >= 25 && bmi < 27) {
      return Colors.yellow[700]!;
    } else if (bmi >= 27 && bmi < 30) {
      return Colors.orange;
    } else if (bmi >= 30 && bmi < 40) {
      return Colors.red[600]!;
    } else {
      return Colors.red[800]!;
    }
  }

  IconData _getBMIIcon(double bmi) {
    if (bmi < 18) {
      return Icons.trending_down;
    } else if (bmi >= 18 && bmi < 25) {
      return Icons.check_circle;
    } else if (bmi >= 25 && bmi < 27) {
      return Icons.warning;
    } else if (bmi >= 27 && bmi < 30) {
      return Icons.warning_amber;
    } else if (bmi >= 30 && bmi < 40) {
      return Icons.error;
    } else {
      return Icons.dangerous;
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = _getBMICategory(bmi);
    final description = _getBMIDescription(bmi);
    final color = _getBMIColor(bmi);
    final icon = _getBMIIcon(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado del IMC'),
        centerTitle: true,
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            
            // Tarjeta principal con el resultado
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    // Icono del resultado
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Valor del IMC
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Categoría
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Descripción
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Información detallada
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Información detallada:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildInfoRow('Peso:', '${weight.toStringAsFixed(1)} kg'),
                    _buildInfoRow('Estatura:', '${height.toStringAsFixed(2)} m'),
                    _buildInfoRow('IMC calculado:', bmi.toStringAsFixed(1)),
                    _buildInfoRow('Clasificación:', category),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Tabla de rangos de IMC
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rangos de IMC:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildBMIRangeRow('Menor a 18', 'Peso Bajo', Colors.orange),
                    _buildBMIRangeRow('18 - 24.9', 'Normal', Colors.green),
                    _buildBMIRangeRow('25 - 26.9', 'Obesidad', Colors.yellow[700]!),
                    _buildBMIRangeRow('27 - 29.9', 'Obesidad Grado I', Colors.orange),
                    _buildBMIRangeRow('30 - 39.9', 'Obesidad Grado II', Colors.red[600]!),
                    _buildBMIRangeRow('Mayor de 40', 'Obesidad Grado III', Colors.red[800]!),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.calculate),
                    label: const Text('Nuevo Cálculo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Regresar a la pantalla de splash que luego navegará a la calculadora
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.home),
                    label: const Text('Inicio'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBMIRangeRow(String range, String category, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              range,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              category,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
