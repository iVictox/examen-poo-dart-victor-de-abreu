import 'dart:async';
import 'bebida.dart';

class Cafe extends Bebida {
  Cafe(String tamano) : super('Café', tamano);

  @override
  String obtenerDescripcion() {
    return '$nombre de tamaño $tamano';
  }

  @override
  Future<void> preparar() async {
    print('Progreso » Moliendo granos de café');
    await Future.delayed(Duration(seconds: 2));
    print('Progreso » Preparando el $nombre');
    await Future.delayed(Duration(seconds: 2));
    print('$nombre servido!');
  }
}