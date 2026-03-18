import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';

class TrabajadorCard extends StatelessWidget {
  final int idTrabajador;
  final String nombre;
  final String apellido;
  final String telefono;
  final dynamic? foto;

  const TrabajadorCard({
    super.key,
    required this.idTrabajador,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    this.foto,
  });

  @override
  Widget build(BuildContext context) {
    final totalCorte = context.watch<TurnosProvider>().sumaCortesPorTrabajador(
      idTrabajador,
    );
    String nombreCompleto = "$nombre $apellido";

    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: (foto != null && foto.toString().isNotEmpty)
                  ? NetworkImage(foto)
                  : null,
              child: (foto == null || foto.toString().isEmpty)
                  ? Text(
                      nombre.isNotEmpty ? nombre[0].toUpperCase() : "?",
                      style: const TextStyle(fontSize: 22, color: Colors.black),
                    )
                  : null,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombreCompleto,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Tel: $telefono",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "ID: $idTrabajador",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutBack,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: Text(
                'Corte: \$${totalCorte.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: totalCorte >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
