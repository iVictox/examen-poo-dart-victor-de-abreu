import '../interfaces/imprimible.dart';
import '../interfaces/preparable.dart';

abstract class Bebida implements Preparable, Imprimible {
  String nombre;
  String tamano;

  Bebida(this.nombre, this.tamano);
}