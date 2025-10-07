import 'dart:async';
import '../models/bebida.dart';

class Pedido {
  static int contadorId = 0;
  static int get totalPedidos => contadorId;

  final int id;
  final List<Bebida> items = [];

  // StreamController para notificar el progreso del pedido en tiempo real.
  final controladorDeEstado = StreamController<String>();
  /// Stream público para que otros puedan escuchar el progreso.
  Stream<String> get enProgreso => controladorDeEstado.stream;
  // Constructor que asigna un ID único al crear un nuevo pedido.
  Pedido() : id = ++contadorId;

  /// Agrega una bebida a la lista de items del pedido.
  void agregarBebida(Bebida bebida) {
    items.add(bebida);
  }

  /// Procesar el pedido de forma asíncrona.
  Future<void> procesarPedido() async {
    controladorDeEstado.add('Pedido #$id recibido. Preparando...');
    await Future.delayed(Duration(seconds: 1)); 

    for (var item in items) {
      controladorDeEstado.add('Preparando: ${item.obtenerDescripcion()}');
      await item.preparar(); 
      controladorDeEstado.add('${item.nombre} está listo.');
    }
    controladorDeEstado.close();
  }
}