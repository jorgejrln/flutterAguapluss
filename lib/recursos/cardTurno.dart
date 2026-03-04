import 'package:flutter/material.dart';

class TurnoCard extends StatelessWidget {
  final int id;
  final String fecha;
  final int idTrabajador;
  final String nombre;
  final int total;
  final int fondo;
  final int corte;
  final String fotoUrl;

  const TurnoCard({
    super.key,
    required this.id,
    required this.nombre,
    required this.fecha,
    required this.total,
    required this.fondo,
    required this.corte,
    required this.fotoUrl, required this.idTrabajador,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [

            // 📸 Foto del trabajador
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(fotoUrl),
              backgroundColor: Colors.grey[200],
            ),

            const SizedBox(width: 16),

            // 📊 Información
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text("Fecha: $fecha"),
                  Text("Fondo: \$${fondo.toStringAsFixed(2)}"),
                  Text("Corte: \$${corte.toStringAsFixed(2)}"),
                ],
              ),
            ),

            // 💰 Total grande
            Text(
              "\$${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}