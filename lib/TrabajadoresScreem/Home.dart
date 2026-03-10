import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class HomeU extends StatefulWidget {
  const HomeU({super.key});

  @override
  State<HomeU> createState() => _HomeUState();
}

class _HomeUState extends State<HomeU> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    bool esCelular = width < 600;

    return Scaffold(
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

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: esCelular
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    botonIniciarTurno(),
                    const SizedBox(height: 30),
                    botonVerTurnos(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    botonIniciarTurno(),
                    const SizedBox(width: 40),
                    botonVerTurnos(),
                  ],
                ),
        ),
      ),
    );
  }

  // BOTON INICIAR TURNO
  Widget botonIniciarTurno() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/TurnoScreen");
      },
      child: Container(
        width: 260,
        height: 140,
        decoration: BoxDecoration(
          color: Colores.acent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_fill, size: 45, color: Colors.white),
            SizedBox(height: 10),
            Text(
              "INICIAR TURNO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  // BOTON VER TURNOS
  Widget botonVerTurnos() {
    return InkWell(
      onTap: () {
        print("Ver turnos");
      },
      child: Container(
        width: 260,
        height: 140,
        decoration: BoxDecoration(
          color: Colores.secondary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt, size: 45, color: Colors.white),
            SizedBox(height: 10),
            Text(
              "VER TURNOS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}