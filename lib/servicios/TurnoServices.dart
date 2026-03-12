import 'package:http/http.dart' as http;
import 'package:proyecto_aguapluss/Models/CerrarTurno.dart';
import 'package:proyecto_aguapluss/Models/CrearTurno.dart';
import 'dart:convert';

import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/TurnoScreen.dart';

class Turnoservices {
Future<List<Turno>> obtenerTurnos() async {
  final url = Uri.parse('http://localhost:5041/Turnos');
  final response = await http.get(url);

  print("STATUS: ${response.statusCode}");
  print("BODY: ${response.body}");

  if (response.statusCode == 200) {
    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => Turno.fromJson(e)).toList();
  } else {
    throw Exception('Error al obtener turnos');
  }
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

  Future<void> eliminarTurno(int id) async {
    final url = Uri.parse('http://localhost:5041/Turnos/$id');
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      throw Exception('Error al eliminar el turno');
    }
  }

  Future<Turno?> ultimoTurno() async {
    final url = Uri.parse('http://localhost:5041/Turnos/Ultimo');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.isEmpty) return null;

      final decoded = jsonDecode(response.body);

      if (decoded == null) return null;

      return Turno.fromJson(decoded);
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }

  Future<void> TerminarTurno(CerrarTurno turno) async {

  final url = Uri.parse('http://localhost:5041/Turnos/CerrarTurno');

  final response = await http.put(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(turno.toJson()),
  );

  if (response.statusCode != 200 && response.statusCode != 204) {
    throw Exception('Error al cerrar el turno');
  }

}


Future<List<Turno>> obtenerUltimos3Turnos() async {
  final url = Uri.parse('http://localhost:5041/Turnos/Ultimos3');
  final response = await http.get(url);

  print("STATUS: ${response.statusCode}");
  print("BODY: ${response.body}");

  if (response.statusCode == 200) {
    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => Turno.fromJson(e)).toList();
  } else {
    throw Exception('Error al obtener turnos');
  }
}
 


}
