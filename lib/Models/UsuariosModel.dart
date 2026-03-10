// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    int idUsuario;
    String usuario;
    String? password;
    int idRol;
    int idTrabajador;
    String rol;

    Usuario({
        required this.idUsuario,
        required this.usuario,
        required this.password,
        required this.idRol,
        required this.idTrabajador,
        required this.rol,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["idUsuario"],
        usuario: json["usuario"],
        password: json["password"],
        idRol: json["idRol"],
        idTrabajador: json["idTrabajador"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "usuario": usuario,
        "password": password,
        "idRol": idRol,
        "idTrabajador": idTrabajador,
        "rol": rol,
    };
}
