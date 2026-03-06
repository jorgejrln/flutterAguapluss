import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class Dinero extends StatelessWidget {
  final int cantidad;
  final VoidCallback? onTap;

  const Dinero({
    super.key,
    required this.cantidad,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),

          // 📌 RESPONSIVO
          width: screenWidth < 600 ? double.infinity : 300,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ICONO
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colores.secondary.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.attach_money_rounded,
                  size: 35,
                  color: Colores.secondary,
                ),
              ),

              const SizedBox(height: 15),

              // TITULO
              const Text(
                "CAPITAL ACTUAL",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              // DINERO
              Text(
                "\$ ${cantidad.toString()}",
                style: const TextStyle(
                  fontSize: 40,
                  color: Colores.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // SUBTEXTO
              const Text(
                "Total del turno",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}