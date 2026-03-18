import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/providers/trabajadores_providers.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/recursos/cardTrabajador.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class TrabajadoresScreen extends StatefulWidget {
  const TrabajadoresScreen({super.key});

  @override
  State<TrabajadoresScreen> createState() => _TrabajadoresScreenState();
}

class _TrabajadoresScreenState extends State<TrabajadoresScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TrabajadoresProviders>().obtenerTrabajadores();
      context.read<TurnosProvider>().obtenerTurnos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final trabajadores = context.watch<TrabajadoresProviders>().trabajadores;
    final turnos = context.watch<TurnosProvider>().turnos;
print("TURNOS CARGADOS: ${turnos.length}");
    return Scaffold(
      backgroundColor: Colores.primary,


      body: trabajadores.isEmpty
          ? const Center(child: Text("No hay trabajadores"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: trabajadores.length,
              itemBuilder: (context, index) {
                final trabajador = trabajadores[index];

                return TrabajadorCard(
                  idTrabajador: trabajador.idTrabajador,
                  nombre: trabajador.nombreTrabajador,
                  apellido: trabajador.apellidoTrabajador,
                  telefono: trabajador.telefonoTrabajador,
                  foto: trabajador.foto,
                );
              },
            ),
    );
  }
}