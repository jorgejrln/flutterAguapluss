import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/Home.dart';
import 'package:proyecto_aguapluss/TrabajadoresScreem/TurnoScreen.dart';
import 'package:proyecto_aguapluss/home/home-Admin.dart';
import 'package:proyecto_aguapluss/home/screenTrabajadores.dart';
import 'package:proyecto_aguapluss/providers/UsuariosProvider.dart';
import 'package:proyecto_aguapluss/widgets/login.dart';
import 'package:proyecto_aguapluss/home/screenHome.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuariosProvider()),
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
      title: 'Aguapluss',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/adminHome': (context) => const Home(),
        '/trabajadorHome': (context) => const HomeU(),
        "/TurnoScreen": (context) => const CrearTurno(),
      },
    );
  }
}