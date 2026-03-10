import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class CrearTurno extends StatefulWidget {
  const CrearTurno({super.key});

  @override
  State<CrearTurno> createState() => _CrearTurnoState();
}

class _CrearTurnoState extends State<CrearTurno> {
  @override
  Widget build(BuildContext context) {


 double screenWidth = MediaQuery.of(context).size.width;
    bool esCelular = screenWidth < 700;

    return  Scaffold(
      backgroundColor: Colores.primary,

       appBar: AppBar(
        backgroundColor: Colores.secondary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'SISTEMA DE CONTROL "AGUA PLUS"',
          style: TextStyle(
            fontSize: esCelular ? 18 : 20,
          ),
        ),
      ),

      endDrawer: const Sidemenu(),

      body: const Center(
        child: Text("AQUÍ VA EL FORMULARIO DE CREAR TURNO"),
      ),

    );
  }
}