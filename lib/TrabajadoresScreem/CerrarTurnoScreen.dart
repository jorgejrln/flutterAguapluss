import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/Models/CerrarTurno.dart';

import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class CerrarTurnoScreen extends StatefulWidget {
  const CerrarTurnoScreen({super.key});

  @override
  State<CerrarTurnoScreen> createState() => _CerrarTurnoScreenState();
}

class _CerrarTurnoScreenState extends State<CerrarTurnoScreen> {
  final TextEditingController totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool esCelular = width < 700;

    return Scaffold(
      backgroundColor: Colores.primary,

      appBar: AppBar(
        backgroundColor: Colores.secondary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('SISTEMA DE CONTROL "AGUA PLUS"'),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: esCelular ? width * 0.9 : 450,
            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1)),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lock_clock,
                  size: esCelular ? 60 : 70,
                  color: Colores.secondary,
                ),

                const SizedBox(height: 20),

                Text(
                  "Cerrar Turno",
                  style: TextStyle(
                    fontSize: esCelular ? 22 : 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: totalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Total de ventas",
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colores.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    onPressed: () async {
                      if (totalController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Ingrese el total")),
                        );
                      }
                      final turnosProvider = Provider.of<TurnosProvider>(
                        context,
                        listen: false,
                      );
                      print(turnosProvider);

                      CerrarTurno turno = CerrarTurno(
                        fechaFin: DateTime.now(),
                        total: int.parse(totalController.text),
                        lecFin: 0,
                        activo: false,
                        corte: 14
                      );

                      await turnosProvider.cerrarTurno_(turno);

                      Navigator.pushNamed(context, "/trabajadorHome");
                    },

                    child: const Text(
                      "Cerrar Turno",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
