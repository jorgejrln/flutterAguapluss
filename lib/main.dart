import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/CerrarTurnoScreen.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/Home.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/TurnoScreen.dart';
import 'package:proyecto_aguapluss/home/VerTurnosScreen.dart';

import 'package:proyecto_aguapluss/providers/turnos_provider.dart';
import 'package:proyecto_aguapluss/providers/UsuariosProvider.dart';
import 'package:proyecto_aguapluss/widgets/login.dart';
import 'package:proyecto_aguapluss/home/screenHome.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuariosProvider()),
        ChangeNotifierProvider(create: (_) => TurnosProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aguapluss',
    
      routes: {
        '/': (context) => Login(),
        '/adminHome': (context) => Home(),
        '/trabajadorHome': (context) => HomeU(),
        '/TurnoScreen': (context) => CrearTurnoLogin(),
        '/CerrarTurno': (context) => CerrarTurnoScreen(),
        '/VerTurnos': (context) => VerTurnoScreen(),
      },
    );
  }
}