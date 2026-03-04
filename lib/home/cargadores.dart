import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class Cargadores extends StatefulWidget {
  const Cargadores({super.key});

  @override
  State<Cargadores> createState() => _CargadoresState();
}

class _CargadoresState extends State<Cargadores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colores.primary,
     
    );
  }
}