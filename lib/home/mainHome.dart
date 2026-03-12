import 'package:flutter/material.dart';

import 'package:proyecto_aguapluss/widgets/login.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return 
      Scaffold(
       
        body: Login(),
      );
    
  }
}
