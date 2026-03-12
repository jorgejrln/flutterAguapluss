import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class TurnoDataSource extends DataGridSource {
  List<DataGridRow> _rows = [];

  TurnoDataSource(List<Turno> turnos) {
    _rows = turnos.map((t) {
      return DataGridRow(
        cells: [
          DataGridCell<int>(columnName: "id", value: t.id),
          DataGridCell<DateTime>(columnName: "fecha", value: t.fecha),
          DataGridCell<String>(
            columnName: "trabajador",
            value: t.nombreTrabajador ?? "",
          ),
          DataGridCell<int>(columnName: "lecIn", value: t.lecIn),
          DataGridCell<int>(columnName: "lecFin", value: t.lecFin),
          DataGridCell<int>(columnName: "total", value: t.total),
          DataGridCell<int>(columnName: "fondo", value: t.fondo),
          DataGridCell<DateTime>(columnName: 'fechaFin', value: t.fechaFin),
          DataGridCell<int>(columnName: "corte", value: t.corte),
        ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: _rows.indexOf(row) % 2 == 0 ? Colors.grey[100] : Colors.white,
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: Text(cell.value.toString(), style: TextStyle(fontSize: 18)),
        );
      }).toList(),
    );
  }
}
