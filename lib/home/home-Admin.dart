import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/recursos/cardTurno.dart';
import 'package:proyecto_aguapluss/recursos/cardsDinero.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Turno> turnos = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    cargarTurnos();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(body: Center(child: Text("Error: $error")));
    }

    if (turnos.isEmpty) {
      return const Scaffold(body: Center(child: Text("No hay turnos")));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    bool esCelular = screenWidth < 700;

    Turno turnoActual = turnos[0];

    return Scaffold(
      backgroundColor: Colores.primary,

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: esCelular
                ? Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.8,
                        height: 250,
                        child: Dinero(
                          cantidad: turnoActual.total,
                          onTap: () {},
                        ),
                      ),
                          SizedBox(height: 30),
                      ...turnos.map((turno) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TurnoCard(
                            id: turno.id,
                            idTrabajador: turno.idTrabajador,
                            nombre: turno.nombreTrabajador ?? "Sin nombre",
                            fecha: turno.fecha?.toString() ?? "Sin fecha",
                            total: turno.total,
                            fondo: turno.fondo,
                            corte: turno.corte,
                            fotoUrl: 'https://picsum.photos/200',
                          ),
                        );
                      }),

                      /// BOTON
                      SizedBox(
                         width: screenWidth * 0.8,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colores.secondary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        
                          onPressed: () {
                            Navigator.pushNamed(context, "/historialTurnos");
                          },
                          icon: const Icon(Icons.list),
                          label: const Text("Ver todos los turnos"),
                        ),
                      ),
                    ],
                  )
                /// WEB / TABLET
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TURNOS
                      Column(
                        children: [
                          ...turnos.map((turno) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                width: 600,
                                child: TurnoCard(
                                  id: turno.id,
                                  idTrabajador: turno.idTrabajador,
                                  nombre:
                                      turno.nombreTrabajador ?? "Sin nombre",
                                  fecha: turno.fecha?.toString() ?? "Sin fecha",
                                  total: turno.total,
                                  fondo: turno.fondo,
                                  corte: turno.corte,
                                  fotoUrl: 'https://picsum.photos/200',
                                ),
                              ),
                            );
                          }),

                          const SizedBox(height: 10),

                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colores.secondary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            onPressed: () {
                              Navigator.pushNamed(context, "/VerTurnos");
                            },
                            icon: const Icon(Icons.list),
                            label: const Text("Ver todos los turnos"),
                          ),
                        ],
                      ),

                      const SizedBox(width: 40),

                      /// DINERO
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Dinero(
                          cantidad: turnos.fold(
                            0,
                            (sum, turno) => sum + turno.total,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> cargarTurnos() async {
    try {
      final servicio = TurnosProvider();
      final lista = await servicio.Ultimos3Turnos();

      if (!mounted) return;

      setState(() {
        turnos = lista;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }
}
