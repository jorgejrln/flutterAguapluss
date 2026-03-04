import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class GastosBoton extends StatefulWidget {
  const GastosBoton({super.key});

  @override
  State<GastosBoton> createState() => _GastosBotonState();
}

class _GastosBotonState extends State<GastosBoton> {
  double get screenWidth => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.secondary,
        foregroundColor: Colors.white,

        title: Center(
          child: SafeArea(
            child: Text(
              'SISTEMA DE CONTROL "AGUA PLUS" ',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth < 600 ? 18 : 20, 
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colores.primary,
      body: Center(child: Text('ejemplo')),
    );
  }
}
