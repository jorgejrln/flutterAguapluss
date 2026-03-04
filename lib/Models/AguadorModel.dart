// To parse this JSON data, do
//
//     final aguador = aguadorFromJson(jsonString);

import 'dart:convert';

Aguador aguadorFromJson(String str) => Aguador.fromJson(json.decode(str));

String aguadorToJson(Aguador data) => json.encode(data.toJson());

class Aguador {
    int idAguador;
    String nombreAguador;
    String apellidoAguador;
    String telefonoAguador;
    String fotoAguador;

    Aguador({
        required this.idAguador,
        required this.nombreAguador,
        required this.apellidoAguador,
        required this.telefonoAguador,
        required this.fotoAguador,
    });

    factory Aguador.fromJson(Map<String, dynamic> json) => Aguador(
        idAguador: json["idAguador"],
        nombreAguador: json["nombreAguador"],
        apellidoAguador: json["apellidoAguador"],
        telefonoAguador: json["telefonoAguador"],
        fotoAguador: json["fotoAguador"],
    );

    Map<String, dynamic> toJson() => {
        "idAguador": idAguador,
        "nombreAguador": nombreAguador,
        "apellidoAguador": apellidoAguador,
        "telefonoAguador": telefonoAguador,
        "fotoAguador": fotoAguador,
    };
}
