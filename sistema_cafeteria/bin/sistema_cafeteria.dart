import 'dart:async';
import 'dart:math';
import 'package:sistema_cafeteria/models/cafe.dart';
import 'package:sistema_cafeteria/models/jugo.dart';
import 'package:sistema_cafeteria/models/te.dart';
import 'package:sistema_cafeteria/services/pedido.dart';

void main() async {
  print("#######################################");
  print('   ☕️ BIENVENIDOS A STARBUCKS ☕️');
  print("");
  print('Examen: Sistema de Gestión de Cafetería');
  print("* Estudiante: Víctor Hugo De Abreu Pedrón");
  print("* Cédula: V- 30.839.445");
  print("* Materia: Paradigma de Programación");
  print("#######################################");
  
  final menuDeBebidas = [
    () => Cafe('Pequeño'),
    () => Cafe('Mediano'),
    () => Cafe('Grande'),
    () => Te('Mediano'),
    () => Jugo('Grande'),
  ];

  final random = Random();

  while (true) {
    final pedido = Pedido();
    print('Generando nuevo pedido: #${pedido.id}');
    
    int numeroDeItems = 1 + random.nextInt(3);
     
    for (int i = 0; i < numeroDeItems; i++) {
      final bebidaAleatoria = menuDeBebidas[random.nextInt(menuDeBebidas.length)]();
      pedido.agregarBebida(bebidaAleatoria);
      print('   + Agregado: ${bebidaAleatoria.obtenerDescripcion()}');
    }
    print("#######################################");

    final procesando = pedido.procesarPedido();
    await for (final estado in pedido.enProgreso) {
      print('Progreso » $estado');
    }
    await procesando;
    print('✅ El pedido #${pedido.id} ha sido completado.');
    print("#######################################");
    await Future.delayed(Duration(seconds: 3));
  }
}