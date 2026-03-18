// To parse this JSON data, do
//
//     final aguador = aguadorFromJson(jsonString);

import 'dart:convert';

Trabajador trabajadorFromJson(String str) => Trabajador.fromJson(json.decode(str));

String trabajadorToJson(Trabajador data) => json.encode(data.toJson());

class Trabajador {
    int idTrabajador;
    String nombreTrabajador;
    String apellidoTrabajador;
    String telefonoTrabajador;
    dynamic foto;
    

    Trabajador({
        required this.idTrabajador,
        required this.nombreTrabajador,
        required this.apellidoTrabajador,
        required this.telefonoTrabajador,
        required this.foto,
    });

    factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        idTrabajador: json["idTrabajador"],
        nombreTrabajador: json["nombreTrabajador"],
        apellidoTrabajador: json["apellidoTrabajador"],
        telefonoTrabajador: json["telefonoTrabajador"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "idTrabajador": idTrabajador,
        "nombreTrabajador": nombreTrabajador,
        "apellidoTrabajador": apellidoTrabajador,
        "telefonoTrabajador": telefonoTrabajador,
        "foto": foto,
    };
}
