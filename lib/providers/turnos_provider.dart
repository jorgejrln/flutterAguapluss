import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/CerrarTurno.dart';
import 'package:proyecto_aguapluss/Models/CrearTurno.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/servicios/TurnoServices.dart';

class TurnosProvider extends ChangeNotifier {
  List<Turno> turnos = [];
  Turno? turnoActivo;
  bool cargando = false;

  final Turnoservices servicio = Turnoservices();
bool get hayTurnoActivo => turnoActivo?.activo == true;


  void limpiarTurnos() {
    turnos = [];
    notifyListeners();
  }

  Future<List<Turno>> obtenerTurnos() async {
    turnos = await servicio.obtenerTurnos();
    notifyListeners();
    return turnos;
  }

  Future<Turno?> obtenerTurnoActivo() async {
  cargando = true;
  notifyListeners();

  turnoActivo = await servicio.ultimoTurno();
print("turnoActivo: ${turnoActivo?.activo}");
  cargando = false;
  notifyListeners();

  return turnoActivo;
}

  Future<List<Turno>> refreshTurnos() async {
    turnos = await servicio.obtenerTurnos();
    notifyListeners();
    return turnos;
  }

  Future<void> insertarTurno(CrearTurno turno) async {
    try {
      cargando = true;
      notifyListeners();

      final nuevoTurno = await servicio.agregarTurno(turno);
      turnoActivo = nuevoTurno;
       notifyListeners();
      if (nuevoTurno != null) {
        turnos.insert(0, nuevoTurno);
        
      }
    } catch (e) {
      print("Error al crear turno: $e");
    } finally {
      cargando = false;
      notifyListeners();
    }
  }

  Future<void> cerrarTurno_(CerrarTurno turno) async {
  try {
    cargando = true;
    notifyListeners();

    await servicio.TerminarTurno(turno);
    turnoActivo = null;
     notifyListeners();
  } catch (e) {
    print('Error al cerrar turno: $e');
    rethrow;
  } finally {
    cargando = false;
    notifyListeners();
  }
}

  Future<List<Turno>> obtenerTurnosPorTrabajador(int id) async {
    turnos = await servicio.obtenerTurnosPorTrabajador(id);
    notifyListeners();
    return turnos;
  }

  Future<List<Turno>> obtenerUltimos3Turnos() async {
    turnos = await servicio.obtenerUltimos3Turnos();
    notifyListeners();
    return turnos;
  }

int sumaCortesPorTrabajador(int idTrabajador) {
  return turnos
      .where((t) => t.idTrabajador == idTrabajador)
      .fold(0, (sum, t) => sum + t.corte);
}

}
