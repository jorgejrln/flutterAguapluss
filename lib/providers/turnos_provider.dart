import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_aguapluss/Models/CerrarTurno.dart';
import 'package:proyecto_aguapluss/Models/CrearTurno.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/servicios/TurnoServices.dart';

class TurnosProvider extends ChangeNotifier {
List<Turno> turnos = [];
Turno? ultimo;
 List<Turno> get _turnos => turnos;
bool _cargando = false;
var Servicio =new Turnoservices();
Future<List<Turno>> obtenerTurnos() async {
if (turnos .isNotEmpty) {
  return turnos;
}
var obtenidos = new Turnoservices();
turnos = await obtenidos.obtenerTurnos();
notifyListeners();
return turnos;
 }

Future <Turno?> ultimoTurno() async {
var obtenidos = new Turnoservices();
ultimo = await obtenidos.ultimoTurno() ;
notifyListeners();
return ultimo;
}

Future <List<Turno>> refreshTurnos() async {
 var obtenidos = new Turnoservices();
turnos = await obtenidos.obtenerTurnos();
notifyListeners();

 if (_cargando) return turnos;

  var servicio = Turnoservices();

  turnos = await servicio.obtenerTurnos();

  _cargando = true;

  notifyListeners();

  return turnos;


}
 bool cargando = false;

  Future<void> insertarTurno(CrearTurno _turno) async {
    try {
      await agregarTurno(_turno);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<void> agregarTurno(CrearTurno turno) async {
    final url = Uri.parse('http://localhost:5041/Turnos');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(turno.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al agregar el turno');
    }
  }
 Future<void> cerrarTurno_(CerrarTurno turno) async {
    try {
      cargando = true;
      notifyListeners();

      await Servicio.TerminarTurno(turno);

    } catch (e) {
      print('Error al cerrar turno: $e');
      rethrow;
    } finally {
      cargando = false;
      notifyListeners();
    }
  }

Future<List<Turno>> Ultimos3Turnos() async {
if (turnos .isNotEmpty) {
  return turnos;
}
var obtenidos = new Turnoservices();
turnos = await obtenidos.obtenerUltimos3Turnos();
notifyListeners();
return turnos;
 }


}