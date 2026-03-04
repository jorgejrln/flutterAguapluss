// To parse this JSON data, do
//
//     final carga = cargaFromJson(jsonString);

import 'dart:convert';

Carga cargaFromJson(String str) => Carga.fromJson(json.decode(str));

String cargaToJson(Carga data) => json.encode(data.toJson());

class Carga {
    int idCarga;
    DateTime fecha;
    int idAguador;
    int garrafones;
    bool pagado;
    int idTurno;

    Carga({
        required this.idCarga,
        required this.fecha,
        required this.idAguador,
        required this.garrafones,
        required this.pagado,
        required this.idTurno,
    });

    factory Carga.fromJson(Map<String, dynamic> json) => Carga(
        idCarga: json["idCarga"],
        fecha: DateTime.parse(json["fecha"]),
        idAguador: json["idAguador"],
        garrafones: json["garrafones"],
        pagado: json["pagado"],
        idTurno: json["idTurno"],
    );

    Map<String, dynamic> toJson() => {
        "idCarga": idCarga,
        "fecha": fecha.toIso8601String(),
        "idAguador": idAguador,
        "garrafones": garrafones,
        "pagado": pagado,
        "idTurno": idTurno,
    };
}
