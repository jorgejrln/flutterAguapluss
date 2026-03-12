import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/providers/UsuariosProvider.dart';

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
                    const SizedBox(height: 25),
                    botonTerminarTurno(),
                    const SizedBox(height: 25),
                    botonVerTurnos(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    botonIniciarTurno(),
                    const SizedBox(width: 30),
                    botonTerminarTurno(),
                    const SizedBox(width: 30),
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
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: contenedorBoton(
        icono: Icons.play_circle_fill,
        texto: "INICIAR TURNO",
        color: Colores.acent,
      ),
    );
  }

  // BOTON TERMINAR TURNO
  Widget botonTerminarTurno() {
    return ElevatedButton(
      onPressed: () {
 Navigator.pushNamed(context, "/CerrarTurno");
},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: contenedorBoton(
        icono: Icons.stop_circle,
        texto: "TERMINAR TURNO",
        color: Colores.secondary,
      ),
    );
  }

  // BOTON VER TURNOS
  Widget botonVerTurnos() {
    return InkWell(
      onTap: () {
        print("Ver turnos");
      },
      child: contenedorBoton(
        icono: Icons.list_alt,
        texto: "VER TURNOS",
        color: Colores.secondary,
      ),
    );
  }

  // CONTENEDOR GENERAL DE BOTONES
  Widget contenedorBoton({
    required IconData icono,
    required String texto,
    required Color color,
  }) {
    return Container(
      width: 260,
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icono, size: 45, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
} 