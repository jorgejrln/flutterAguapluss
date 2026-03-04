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
    return Scaffold(
      backgroundColor: Colores.primary,
      body: Row(
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : error != null
              ? Center(child: Text("Error: $error"))
              : ultimoTurno == null
              ? const Center(child: Text("No hay turnos"))
              : 
              
           Spacer(),
              Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 600,
                      height: 150,
                      child: TurnoCard
                      (id: ultimoTurno!.id, idTrabajador: ultimoTurno!.idTrabajador, 
                      nombre: ultimoTurno!.nombreTrabajador ?? 'Nombre no disponible', fecha: ultimoTurno!.fecha, total: ultimoTurno!.total,
                       fondo: ultimoTurno!.fondo, corte: ultimoTurno!.corte, fotoUrl: ''),
                        
                    ),
                  ],
                ),
                
         Spacer(),
          Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 300,
                child: Dinero(
                  cantidad: ultimoTurno?.total ?? 0,
                  onTap: () {
                  
                  },
                ),
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }

  Future<void> cargarTurno() async {
    try {
      final servicio = Turnosprovider();
      final lista = await servicio.ultimoTurno();

      if (lista != null) {
        ultimoTurno = lista;
      }
    } catch (e) {
      error = e.toString();
    }

    setState(() {
      isLoading = false;
    });
  }
}
