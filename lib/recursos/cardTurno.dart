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
    required this.fotoUrl,
    required this.idTrabajador,
  });

  @override
  Widget build(BuildContext context) {

    // 🎨 Color dependiendo del fondo
    Color fondoColor = fondo >= 0 ? Colors.green : Colors.red;

    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [

            // 📸 Foto trabajador
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(fotoUrl),
              backgroundColor: Colors.grey.shade200,
            ),

            const SizedBox(width: 16),

            // 📊 Información
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Nombre
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Fecha: $fecha",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Text(
                        "Fondo: ",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Text(
                        "\$${fondo.toDouble().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fondoColor,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    "Corte: \$${corte.toDouble().toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            // 💰 Total
            Column(
              children: [

                const Text(
                  "TOTAL",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "\$${total.toDouble().toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: fondoColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}