import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/Models/TurnoModel.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/recursos/tableTurnos.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';

  class VerTurnoScreen extends StatefulWidget {
  const VerTurnoScreen({super.key});

  @override
  State<VerTurnoScreen> createState() => _VerTurnoScreenState();
}

class _VerTurnoScreenState extends State<VerTurnoScreen> {
  void filtrarTurnos(String query, List<Turno> turnos) {
    query = query.toLowerCase();

    turnosFiltrados = turnos.where((t) {
      return t.nombreTrabajador.toLowerCase().contains(query) ||
          t.id.toString().contains(query);
    }).toList();
  }

  final TextEditingController _buscarController = TextEditingController();
  List<Turno> turnosFiltrados = [];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<TurnosProvider>(context, listen: false).refreshTurnos();
    });
  }

  @override
  void dispose() {
    _buscarController.dispose(); // libera memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Turnos"),
        backgroundColor: Colores.secondary,
        foregroundColor: Colors.white,
      ),

      backgroundColor: Colores.primary,

      body: Consumer<TurnosProvider>(
        builder: (context, provider, child) {
          
           final lista = _buscarController.text.isEmpty
        ? provider.turnos
        : turnosFiltrados;

    final dataSource = TurnoDataSource(lista);

        return Column(
  children: [

    // 🔎 BUSCADOR
    Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: 400,
        child: TextField(
          style: const TextStyle(fontSize: 16),
          controller: _buscarController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: "Buscar por ID o trabajador",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            setState(() {
              filtrarTurnos(value, provider.turnos);
            }
          );
          },
        ),
      ),
    ),

    
     Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.75,
              child: SfDataGrid(
                source: dataSource,
                    allowColumnsResizing: true,

                    onColumnResizeUpdate: (details) {
                      setState(() {
                        columnWidths[details.column.columnName] = details.width;
                      });
                      return true;
                    },

                    columnWidthMode: ColumnWidthMode.none,

                    gridLinesVisibility: GridLinesVisibility.horizontal,
                    headerGridLinesVisibility: GridLinesVisibility.horizontal,

                    headerRowHeight: 45,
                    rowHeight: 45,
                    columns: [
                      GridColumn(
                        columnName: "id",
                        width: columnWidths['id']!,
                        label: _header("ID"),
                      ),

                      GridColumn(
                        columnName: "fecha",
                        width: columnWidths['fecha']!,
                        label: _header("Fecha"),
                      ),

                      GridColumn(
                        columnName: "trabajador",
                        width: columnWidths['trabajador']!,
                        label: _header("Trabajador"),
                      ),

                      GridColumn(
                        columnName: "lecIn",
                        width: columnWidths['lecIn']!,
                        label: _header("Lectura Inicial"),
                      ),

                      GridColumn(
                        columnName: "lecFin",
                        width: columnWidths['lecFin']!,
                        label: _header("Lectura Final"),
                      ),

                      GridColumn(
                        columnName: "total",
                        width: columnWidths['total']!,
                        label: _header("Total"),
                      ),

                      GridColumn(
                        columnName: "fondo",
                        width: columnWidths['fondo']!,
                        label: _header("Fondo"),
                      ),

                      GridColumn(
                        columnName: "fechaFin",
                        width: columnWidths['fechaFin']!,
                        label: _header("Fecha Fin"),
                      ),

                      GridColumn(
                        columnName: "corte",
                        width: columnWidths['corte']!,
                        label: _header("Corte"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          
          ]
          );
        },
      ),
    );
  }
}

Widget _header(String texto) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    color: Colores.secondary,
    child: Text(
      texto,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Map<String, double> columnWidths = {
  'id': 80,
  'fecha': 150,
  'trabajador': 150,
  'lecIn': 140,
  'lecFin': 140,
  'total': 140,
  'fondo': 100,
  'fechaFin': 150,
  'corte': 100,
};
