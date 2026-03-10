import 'dart:convert';

Turno turnoFromJson(String str) => Turno.fromJson(json.decode(str));

String turnoToJson(Turno data) => json.encode(data.toJson());

class Turno {

  int id;
  String? fecha;
  int idTrabajador;
  int lecIn;
  int lecFin;
  int total;
  int fondo;
  int corte;
  String? nombreTrabajador;

  Turno({
    required this.id,
    this.fecha,
    required this.idTrabajador,
    required this.lecIn,
    required this.lecFin,
    required this.total,
    required this.fondo,
    required this.corte,
    this.nombreTrabajador,
  });

  factory Turno.fromJson(Map<String, dynamic> json) {

    return Turno(
      id: json["id"] ?? 0,
      fecha: json["fecha"],
      idTrabajador: json["idTrabajador"] ?? 0,
      lecIn: json["lecIn"] ?? 0,
      lecFin: json["lecFin"] ?? 0,
      total: json["total"] ?? 0,
      fondo: json["fondo"] ?? 0,
      corte: json["corte"] ?? 0,
      nombreTrabajador: json["nombreTrabajador"],
    );
  }

  Map<String, dynamic> toJson() {

    return {
      "id": id,
      "fecha": fecha,
      "idTrabajador": idTrabajador,
      "lecIn": lecIn,
      "lecFin": lecFin,
      "total": total,
      "fondo": fondo,
      "corte": corte,
      "nombreTrabajador": nombreTrabajador,
    };
  }
}