import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/TrabajadorModel.dart';
import 'package:proyecto_aguapluss/servicios/TrabajadorServices.dart';
import 'package:proyecto_aguapluss/servicios/TurnoServices.dart';

class TrabajadoresProviders extends ChangeNotifier {
  final TrabajadorServices servicio = TrabajadorServices();
 
  List <Trabajador> trabajadores = [];


  Future<List<Trabajador>> obtenerTrabajadores() async {
    trabajadores = await servicio.obtenerTrabajadores();
    notifyListeners();
    return trabajadores;
  }



}