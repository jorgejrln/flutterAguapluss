import 'package:flutter/material.dart';
import '../Models/UsuariosModel.dart';
import '../servicios/UsuariosService.dart';

class UsuariosProvider extends ChangeNotifier {
  Usuario? usuarioActual;
  final _service = UsuariosService();

  Future<Usuario?> validarLogin(String usuario, String password) async {
    try {
      usuarioActual = await _service.validarLogin(usuario, password);
      notifyListeners();
      return usuarioActual;
    } catch (e) {
      usuarioActual = null;
      notifyListeners();
      rethrow;
    }
  }

    
}