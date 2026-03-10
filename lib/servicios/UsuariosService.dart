import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/UsuariosModel.dart';

class UsuariosService {
  final String baseUrl = 'http://localhost:5041/Usuarios'; // Cambia a tu URL real

  Future<Usuario?> validarLogin(String usuario, String password) async {
    final url = Uri.parse('$baseUrl/login?usuario=$usuario&password=$password');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // MUY IMPORTANTE
      },
      body: jsonEncode({
        'usuario': usuario,   // Nombre exacto que espera la API
        'password': password, // Nombre exacto que espera la API
      }),
    );

    if (response.statusCode == 200) {
  return Usuario.fromJson(jsonDecode(response.body));
} 
else if (response.statusCode == 401) {
  throw Exception("Usuario o contraseña incorrectos");
}
else {
  throw Exception("Error ${response.statusCode}");
}
  }
}