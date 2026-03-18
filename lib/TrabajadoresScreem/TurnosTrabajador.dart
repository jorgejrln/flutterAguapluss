import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class TurnosTrabajador extends StatefulWidget {
  final int idTrabajador;
  const TurnosTrabajador({super.key, required this.idTrabajador});

  @override
  State<TurnosTrabajador> createState() => _TurnosTrabajadorState();
}

class _TurnosTrabajadorState extends State<TurnosTrabajador> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<TurnosProvider>(
        context,
        listen: false,
      ).obtenerTurnosPorTrabajador(widget.idTrabajador);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool esCelular = width < 600;

    return Scaffold(
      backgroundColor: Colores.primary,
      appBar: AppBar(
        backgroundColor: Colores.secondary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'SISTEMA DE CONTROL "AGUA PLUS"',
          style: TextStyle(fontSize: esCelular ? 18 : 20),
        ),
      ),

      endDrawer: const Sidemenu(),

      body: Consumer<TurnosProvider>(
        builder: (context, provider, child) {
          if (provider.turnos.isEmpty) {
            return const Center(child: Text("No hay turnos"));
          }

          return ListView.builder(
            itemCount: provider.turnos.length,
            itemBuilder: (context, index) {
              final t = provider.turnos[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text("Turno #${t.id}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      Text("Inicio: ${t.fecha}"),
                      Text("Fin: ${t.fechaFin ?? 'Activo'}"),
                      Text("Total: \$${t.total}"),
                      Text ("Corte: \$${t.corte}"),
                    ],
                  ),
                  trailing: Icon(
                    t.activo ? Icons.play_circle : Icons.check_circle,
                    color: t.activo ? const Color.fromARGB(255, 182, 165, 10) : Colors.green,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
