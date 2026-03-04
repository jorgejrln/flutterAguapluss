
import 'dart:convert';

import 'package:proyecto_aguapluss/Models/TrabajadorModel.dart';
import 'package:http/http.dart' as http;

class TrabajadorServices {
  
  Future <List<Trabajador>> obtenerTrabajadores() async {
    final url = Uri.parse('http://localhost:5041/Trabajadores');
    final response = await http.get(url);

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      final List decoded = jsonDecode(response.body);
      return decoded.map((e) => Trabajador.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener trabajadores');
    }
  }

Future<Trabajador>obtenerTrabajador(int id) async {
    final url = Uri.parse('http://localhost:5041/Trabajadores/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return Trabajador.fromJson(decoded);
    } else {
      throw Exception('Error al obtener el trabajador');
    }
  }



}