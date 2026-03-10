import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proyecto_aguapluss/home/home-Admin.dart';
import 'package:proyecto_aguapluss/recursos/tableTurnos.dart';
import 'package:proyecto_aguapluss/widgets/login.dart';
import 'package:proyecto_aguapluss/home/screemEquivalencia.dart';
import 'package:proyecto_aguapluss/home/cargadores.dart';
import 'package:proyecto_aguapluss/home/screenTrabajadores.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:proyecto_aguapluss/widgets/sideMenu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Inicio(),
    TurnosScreen(),
    Trabajadores(),
    Cargadores(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colores.primary,
      appBar: AppBar(
        backgroundColor: Colores.secondary,
        foregroundColor: Colors.white,
        title: Center(
          child: SafeArea(
            child: Text(
              'SISTEMA DE CONTROL "AGUA PLUS" ',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth < 600 ? 18 : 20, // más chico en celular
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),

      body: IndexedStack(index: _selectedIndex, children: _screens),
      endDrawer: Sidemenu(),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colores.secondary ,
       
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(161, 210, 221, 230),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Inicio', ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Equivalencia', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Trabajadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Aguadores',
          ),
        ],
      ),
    );
  }
}

