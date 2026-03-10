import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/recursos/tableTurnos.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:proyecto_aguapluss/providers/TurnosProvider.dart';

class TurnosScreen extends StatefulWidget {
  const TurnosScreen({super.key});

  @override
  State<TurnosScreen> createState() => _TurnosScreenState();
}

class _TurnosScreenState extends State<TurnosScreen> {
  late TurnoDataSource dataSource;
  List<Turno> turnos = [];

  @override
  void initState() {
    super.initState();
    cargarTurnos();
  }

  Future<void> cargarTurnos() async {
    final servicio = Turnosprovider();

    turnos = await servicio.obtenerTurnos();

    setState(() {
      dataSource = TurnoDataSource(turnos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
     
backgroundColor: Colores.primary,
      body: SfDataGrid(
  source: dataSource,

  columnWidthMode: ColumnWidthMode.fill,
  gridLinesVisibility: GridLinesVisibility.both,
  headerGridLinesVisibility: GridLinesVisibility.both,

  headerRowHeight: 45,
  rowHeight: 45,

  columns: [

    GridColumn(
      columnName: "id",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "ID",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    GridColumn(
      columnName: "fecha",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "Fecha",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    GridColumn(
      columnName: "trabajador",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "Trabajador",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    GridColumn(
      columnName: "lecIn",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "Lectura Inicial",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    GridColumn(
      columnName: "lecFin",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "Lectura Final",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    GridColumn(
      columnName: "total",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "Total",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    GridColumn(
      columnName: "fondo",
      label: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blueGrey,
        child: Text(
          "Fondo",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ],
),
    );
  }
}
