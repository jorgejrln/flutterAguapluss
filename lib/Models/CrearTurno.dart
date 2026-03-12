import 'dart:convert';

CrearTurno crearTurnoFromJson(String str) => CrearTurno.fromJson(json.decode(str));

String crearTurnoToJson(CrearTurno data) => json.encode(data.toJson());

class CrearTurno {

  DateTime? fecha;
  int idTrabajador;
  int lecIn;
  int fondo;
  bool activo;

  CrearTurno({
    this.fecha,
    required this.idTrabajador,
    required this.lecIn,
    required this.fondo,
    required this.activo,
  });

  factory CrearTurno.fromJson(Map<String, dynamic> json) => CrearTurno(
        fecha: json["fecha"] != null ? DateTime.parse(json["fecha"]) : null,
        idTrabajador: json["idTrabajador"],
        lecIn: json["lecIn"],
        fondo: json["fondo"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha?.toIso8601String(),
        "idTrabajador": idTrabajador,
        "lecIn": lecIn,
        "fondo": fondo,
        "activo": activo,
      };
}