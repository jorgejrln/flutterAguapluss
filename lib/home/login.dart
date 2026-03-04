import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/home/screenHome.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usercontroller = TextEditingController();
  final TextEditingController _passworcontroller = TextEditingController();
  String usuario = 'Admin';
  String contrasena = 'Admin';
  _LoginState createState() => _LoginState();
  bool _obscureText = true; // ✅ ahora es variable, no getter

  @override
  Widget build(BuildContext context) {
    void _login1() {
      String input = _passworcontroller.text;
      String input2 = _usercontroller.text;

      if (input != contrasena ||
          input2 != usuario ||
          (input != contrasena && input2 != usuario)) {
        mostrarMensajeFlotante(context, "Usuario o contraseña incorrectos");
      } else {
        Push(context);
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colores.secondary,

          title: Center(
            child: Text(
              'SISTEMA DE CONTROL "AGUA PLUS" ',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth < 600 ? 20 : 28, // más chico en celular
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      backgroundColor: Colores.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth < 600 ? 300 : 400,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Usuario:",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(height: 45),
                      Text("Contraseña:", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: screenWidth < 600 ? 200 : 250,
                        child: TextField(
                          controller: _usercontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colores.secondary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Ingrese su usuario ",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: screenWidth < 600 ? 200 : 250,
                        child: TextField(
                          controller: _passworcontroller,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Inrese su contraseña',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colores.secondary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colores.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                _login1();
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }

  void Push(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }


void mostrarMensajeFlotante(BuildContext context, String mensaje) {
  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 100,
      left: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 219, 84, 51),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
          ),
          child: Text(
            mensaje,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
}
