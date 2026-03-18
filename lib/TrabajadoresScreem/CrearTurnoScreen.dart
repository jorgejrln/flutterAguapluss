import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/Models/UsuariosModel.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/Home.dart';
import 'package:proyecto_aguapluss/providers/UsuariosProvider.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';
import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/Models/CrearTurno.dart';

class CrearTurnoLogin extends StatefulWidget {
  const CrearTurnoLogin({super.key});

  @override
  State<CrearTurnoLogin> createState() => _CrearTurnoState();
}

class _CrearTurnoState extends State<CrearTurnoLogin> { 

  final TextEditingController fondoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final usuarioProvider = context.read<UsuariosProvider>();
    final Usuario? usuario = usuarioProvider.usuarioActual;

    double screenWidth = MediaQuery.of(context).size.width;
    bool esCelular = screenWidth < 700;

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
        child: SingleChildScrollView(
          child: Container(
            width: esCelular ? screenWidth * 0.9 : 450,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  Icons.account_balance_wallet,
                  size: esCelular ? 60 : 70,
                  color: Colores.secondary,
                ),

                const SizedBox(height: 20),

                Text(
                  "Fondo Inicial del Turno",
                  style: TextStyle(
                    fontSize: esCelular ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: fondoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Ingrese el fondo",
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colores.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    onPressed: () async {

                      if (fondoController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Ingrese el fondo")),
                        );
                        return;
                      }

                      if (usuario == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Usuario no encontrado")),
                        );
                        return;
                      }

                      final turnoProvider = context.read<TurnosProvider>();

                      CrearTurno turno = CrearTurno(
                        fecha: DateTime.now(),
                        idTrabajador: (usuario.idTrabajador),
                        lecIn: 0,
                        fondo: int.parse(fondoController.text),
                        activo: true,
                      );

                     await  turnoProvider.insertarTurno(turno);
                      await turnoProvider.obtenerTurnoActivo(); 
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        "/trabajadorHome",
                        (route) => false,
                      );
                    },

                    child: const Text(
                      "Crear Turno",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

