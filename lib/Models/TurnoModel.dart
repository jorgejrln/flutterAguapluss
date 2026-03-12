import 'dart:convert';

Turno turnoFromJson(String str) => Turno.fromJson(json.decode(str));

String turnoToJson(Turno data) => json.encode(data.toJson());

class Turno {

 int id;
  DateTime? fecha;
  int idTrabajador;
  int lecIn;
  int lecFin;
  int total;
  int fondo;
  int corte;
  DateTime? fechaFin;
  bool activo;
  String nombreTrabajador;

  Turno({
    required this.id,
    this.fecha,
    required this.idTrabajador,
    required this.lecIn,
    required this.lecFin,
    required this.total,
    required this.fondo,
    required this.corte,
    this.fechaFin,
    required this.activo,
    required this.nombreTrabajador,
  });

  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
        id: json["id"],
        fecha: json["fecha"] != null ? DateTime.parse(json["fecha"]) : null,
        idTrabajador: json["idTrabajador"],
        lecIn: json["lecIn"],
        lecFin: json["lecFin"],
        total: json["total"],
        fondo: json["fondo"],
        corte: json["corte"],
        fechaFin: json["fechaFin"] != null
            ? DateTime.parse(json["fechaFin"])
            : null,
        activo: json["activo"],
        nombreTrabajador: json["nombreTrabajador"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha?.toIso8601String(),
        "idTrabajador": idTrabajador,
        "lecIn": lecIn,
        "lecFin": lecFin,
        "total": total,
        "fondo": fondo,
        "corte": corte,
        "fechaFin": fechaFin?.toIso8601String(),
        "activo": activo,
        "nombreTrabajador": nombreTrabajador,
      };
}