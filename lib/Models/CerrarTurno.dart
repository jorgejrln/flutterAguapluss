// To parse this JSON data, do
//
//     final cerrarTurno = cerrarTurnoFromJson(jsonString);

import 'dart:convert';

CerrarTurno cerrarTurnoFromJson(String str) => CerrarTurno.fromJson(json.decode(str));

String cerrarTurnoToJson(CerrarTurno data) => json.encode(data.toJson());

class CerrarTurno {
    int? lecFin;
    int? total;
    int corte;
    DateTime? fechaFin;
    bool activo = false;

    CerrarTurno({
         this.lecFin,
        required this.total,
         required this.corte,
         this.fechaFin,
         this.activo = false,
    });

    factory CerrarTurno.fromJson(Map<String, dynamic> json) => CerrarTurno(
        lecFin: json["lecFin"],
        total: json["total"],
        corte: json["corte"],
        fechaFin: DateTime.parse(json["fechaFin"]),
        activo: json["activo"],

    );

    Map<String, dynamic> toJson() => {
        "lecFin": lecFin,
        "total": total,
        "corte": corte,
        "fechaFin": fechaFin?.toIso8601String(),
        "activo": activo,
    };
}
