import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/TurnosTrabajador.dart';
import 'package:proyecto_aguapluss/providers/UsuariosProvider.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class HomeU extends StatefulWidget {
  const HomeU({super.key});

  @override
  State<HomeU> createState() => _HomeUState();
}

class _HomeUState extends State<HomeU> {
  
@override
void initState() {
  super.initState();

  Future.microtask(() {
    context.read<TurnosProvider>().obtenerTurnoActivo();
  });
}

  @override
  Widget build(BuildContext context) {
  print(context.watch<TurnosProvider>().hayTurnoActivo);
  final provider = context.watch<TurnosProvider>();

  if (provider.cargando) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }




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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: esCelular
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    botonIniciarTurno(),
                    const SizedBox(height: 25),
                    botonTerminarTurno(),
                    const SizedBox(height: 25),
                    botonVerTurnos(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    botonIniciarTurno(),
                    const SizedBox(width: 30),
                    botonTerminarTurno(),
                    const SizedBox(width: 30),
                    botonVerTurnos(),
                  ],
                ),
        ),
      ),
    );
  }


  Widget botonIniciarTurno() {
    final hayTurnoActivo = context.watch<TurnosProvider>().hayTurnoActivo;
     
    return ElevatedButton(
      onPressed: hayTurnoActivo ? null : () {
        Navigator.pushNamed(context, "/TurnoScreen");
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: contenedorBoton(
        icono: hayTurnoActivo ? Icons.block : Icons.play_circle_fill,
        texto: "INICIAR TURNO",
        color: hayTurnoActivo ? Colors.grey : Colores.acent,
      ),
    );
  }

 
  Widget botonTerminarTurno() {
    final hayTurnoActivo = context.watch<TurnosProvider>().hayTurnoActivo;
      
    return ElevatedButton(
      onPressed: !hayTurnoActivo ? null : () {
        Navigator.pushNamed(context, "/CerrarTurno");
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: contenedorBoton(
        icono: !hayTurnoActivo ? Icons.block : Icons.stop_circle,
        texto: "TERMINAR TURNO",
        color: !hayTurnoActivo ? Colors.grey : Colores.secondary,
      ),
    );
  }

  
  Widget botonVerTurnos() {
    return InkWell(
      onTap: ()async {
        final usuarioProvider = context.read<UsuariosProvider>();
        final usuario = usuarioProvider.usuarioActual;

        if (usuario == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Usuario no encontrado")),
          );
          return;
        }

        context.read<TurnosProvider>().obtenerTurnosPorTrabajador(usuario.idTrabajador);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TurnosTrabajador(idTrabajador: usuario.idTrabajador),
          ),
        );
      },
      child: contenedorBoton(
        icono: Icons.list_alt,
        texto: "VER TURNOS",
        color: Colores.secondary,
      ),
    );
  }


  Widget contenedorBoton({
    required IconData icono,
    required String texto,
    required Color color,
  }) {
    return Container(
      width: 260,
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icono, size: 45, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}