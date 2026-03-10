import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/Models/TrabajadorModel.dart';
import 'package:proyecto_aguapluss/home/ScreemGastos.dart';
import 'package:proyecto_aguapluss/home/screenHome.dart';
import 'package:proyecto_aguapluss/providers/TurnosProvider.dart';
import 'package:proyecto_aguapluss/recursos/cardTurno.dart';
import 'package:proyecto_aguapluss/recursos/cardsDinero.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/recursos/cardsTrabajadores.dart';
import 'package:proyecto_aguapluss/servicios/TurnoServices.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Turno? ultimoTurno;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    cargarTurno();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) {
      return Scaffold(body: Center(child: Text("Error: $error")));
    }

    if (ultimoTurno == null) {
      return const Scaffold(body: Center(child: Text("No hay turnos")));
    }

    // 📌 AQUÍ detectamos el tamaño de pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    bool esCelular = screenWidth < 700;

    return Scaffold(
      
      
      backgroundColor: Colores.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: esCelular
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // 📌 CARD DINERO
                      SizedBox(
                        width: screenWidth * 0.8,
                        height: 300,
                        child: Dinero(
                          cantidad: ultimoTurno!.total,
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 📌 CARD TURNO
                      SizedBox(
                        width: screenWidth * 0.9,
                        child: TurnoCard(
                          id: ultimoTurno!.id,
                          idTrabajador: ultimoTurno!.idTrabajador,
                          nombre:
                              ultimoTurno!.nombreTrabajador ??
                              'Nombre no disponible',
                         fecha: ultimoTurno!.fecha ?? 'Sin fecha',
                          total: ultimoTurno!.total,
                          fondo: ultimoTurno!.fondo,
                          corte: ultimoTurno!.corte,
                          fotoUrl: 'https://picsum.photos/200',
                        ),
                      ),
                    ],
                  )
                // 💻 WEB / TABLET
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 📌 CARD TURNO
                      Column(
                        children: [
                          SizedBox(
                            width: 600,
                            height: 150,
                            child: TurnoCard(
                              id: ultimoTurno!.id,
                              idTrabajador: ultimoTurno!.idTrabajador,
                              nombre:
                                  ultimoTurno!.nombreTrabajador ??
                                  'Nombre no disponible',
                              fecha: ultimoTurno!.fecha ?? 'Sin fecha',
                              total: ultimoTurno!.total,
                              fondo: ultimoTurno!.fondo,
                              corte: ultimoTurno!.corte,
                              fotoUrl: 'https://picsum.photos/200',
                            ),
                          ),

                          const SizedBox(height: 30),
                          Text( "Ultimos dos turnos" ),
                          SizedBox(
                            width: 600,
                            height: 150,
                            child: TurnoCard(
                              id: ultimoTurno!.id,
                              idTrabajador: ultimoTurno!.idTrabajador,
                              nombre:
                                  ultimoTurno!.nombreTrabajador ??
                                  'Nombre no disponible',
                            fecha: ultimoTurno!.fecha ?? 'Sin fecha',
                              total: ultimoTurno!.total,
                              fondo: ultimoTurno!.fondo,
                              corte: ultimoTurno!.corte,
                              fotoUrl: 'https://picsum.photos/200',
                            ),
                          ),
                          
                          SizedBox(
                            width: 600,
                            height: 150,
                            child: TurnoCard(
                              id: ultimoTurno!.id,
                              idTrabajador: ultimoTurno!.idTrabajador,
                              nombre:
                                  ultimoTurno!.nombreTrabajador ??
                                  'Nombre no disponible',
                           fecha: ultimoTurno!.fecha ?? 'Sin fecha',
                              total: ultimoTurno!.total,
                              fondo: ultimoTurno!.fondo,
                              corte: ultimoTurno!.corte,
                              fotoUrl: 'https://picsum.photos/200',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 50),

                      // 📌 CARD DINERO
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Dinero(
                          cantidad: ultimoTurno!.total,
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

  Future<void> cargarTurno() async {
    try {
      final servicio = Turnosprovider();
      final lista = await servicio.ultimoTurno();

      if (!mounted) return;

      setState(() {
        ultimoTurno = lista;
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
