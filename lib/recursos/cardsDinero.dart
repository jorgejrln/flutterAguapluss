import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class Dinero extends StatelessWidget {
  final int cantidad;
  final String? fotoUrl;
  final VoidCallback? onTap;

  const Dinero({
    super.key,
    required this.cantidad,
    this.fotoUrl,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,

              

            children: [
                Text('CAPITAL',
                  style: const TextStyle(
                  color:Colores.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,)
                ),
              SizedBox(height: 10,),
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    fotoUrl != null ? NetworkImage(fotoUrl!) : null,
                child: fotoUrl == null
                    ? const Icon(
                        Icons.monetization_on_rounded,
                        size: 50,
                      )
                    : null,
              ),
              const SizedBox(height: 20),
              Text(
                '\$ ${cantidad.toStringAsFixed(2)}',
                style: const TextStyle(
                  color:Colores.secondary,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 49),
            ],
          ),
        ),
      ),
    );
  }
}
