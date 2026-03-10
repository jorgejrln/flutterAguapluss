import 'package:flutter/material.dart';

import 'package:proyecto_aguapluss/home/mainHome.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationDrawer(
        
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (index) {
          setState(() {
            navDrawerIndex = index;
          });

          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          }
        },
        children: const [
          
          NavigationDrawerDestination(
            icon: Icon(Icons.arrow_back),
            label: Text('Volver'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.logout),
            label: Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
