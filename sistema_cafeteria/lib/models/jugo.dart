import 'dart:async';
import 'bebida.dart';

/// Representa una bebida de tipo Jugo.
class Jugo extends Bebida {
  Jugo(String tamano) : super('Jugo de Naranja', tamano);

  @override
  String obtenerDescripcion() {
    return '$nombre de tamaño $tamano';
  }

  @override
  Future<void> preparar() async {
    print('Progreso » Exprimiendo las naranjas');
    await Future.delayed(Duration(seconds: 3));
    print('$nombre servido!');
  }
}