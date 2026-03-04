import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyecto_aguapluss/Models/TurnoModel.dart';

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

  Future<void> agregarTurno(Turno turno) async {
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
}
