
// To parse this JSON data, do
//
//     final turno = turnoFromJson(jsonString);

import 'dart:convert';

Turno turnoFromJson(String str) => Turno.fromJson(json.decode(str));

String turnoToJson(Turno data) => json.encode(data.toJson());

class Turno {
    int id;
    dynamic fecha;
    int idTrabajador;
    int lecIn;
    int lecFin;
    int total;
    int fondo;
    int corte;
    String? nombreTrabajador;

    Turno({
        required this.id,
        required this.fecha,
        required this.idTrabajador,
        required this.lecIn,
        required this.lecFin,
        required this.total,
        required this.fondo,
        required this.corte,
        required this.nombreTrabajador,
    });

    factory Turno.fromJson(Map<String, dynamic> json) => Turno(
        id: json["id"],
        fecha: json['fecha'] != null ? json['fecha'] : '',
        idTrabajador: json["idTrabajador"],
        lecIn: json["lecIn"],
        lecFin: json["lecFin"],
        total: json["total"],
        fondo: json["fondo"],
        corte: json["corte"],
        nombreTrabajador: json["nombreTrabajador"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha,
        "idTrabajador": idTrabajador,
        "lecIn": lecIn,
        "lecFin": lecFin,
        "total": total,
        "fondo": fondo,
        "corte": corte,
        "nombreTrabajador": nombreTrabajador
    };
}
