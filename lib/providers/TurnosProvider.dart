import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/servicios/TurnoServices.dart';

class Turnosprovider extends ChangeNotifier {
List<Turno> turnos = [];
Turno? ultimo;
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
return turnos;
}




}