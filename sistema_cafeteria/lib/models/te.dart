import 'dart:async';
import 'bebida.dart';

class Te extends Bebida {
  Te(String tamano) : super('Té', tamano);

  @override
  String obtenerDescripcion() {
    return '$nombre de tamaño $tamano';
  }

  @override
  Future<void> preparar() async {
    print('Progreso » Calentando el agua para el té...');
    await Future.delayed(Duration(seconds: 1));
    print('Progreso » Infusionando las hojas de té...');
    await Future.delayed(Duration(seconds: 3));
    print('$nombre servido!');
  }
}