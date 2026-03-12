import 'package:flutter/material.dart';
import 'package:proyecto_aguapluss/Models/UsuariosModel.dart';
import 'package:proyecto_aguapluss/home/screenHome.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_aguapluss/servicios/UsuariosService.dart';
import 'package:proyecto_aguapluss/Models/UsuariosModel.dart';
import 'package:proyecto_aguapluss/providers/UsuariosProvider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _usercontroller = TextEditingController();
  final TextEditingController _passworcontroller = TextEditingController();
 Future<void> login() async {
    final usuario = _usercontroller.text.trim();
    final password = _passworcontroller.text.trim();

    if (usuario.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena todos los campos')),
      );
      return; // No hacemos la petición si faltan campos
    }}

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {





    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.secondary,
        centerTitle: true,
        title: Text(
          'SISTEMA DE CONTROL "AGUA PLUS"',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth < 600 ? 18 : 22, // RESPONSIVE
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
                maxWidth: screenWidth < 600 ? 320 : 450, // RESPONSIVE
              ),

              child: screenWidth < 600
                  // 📱 DISEÑO PARA CELULAR
                  ? Column(
                      children: [
                        const Text("Usuario:", style: TextStyle(fontSize: 20)),

                        const SizedBox(height: 10),

                        TextField(
                          controller: _usercontroller,
                          decoration: InputDecoration(
                            hintText: "Ingrese su usuario",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Contraseña:",
                          style: TextStyle(fontSize: 20),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: _passworcontroller,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Ingrese su contraseña',
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
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    )
                  // 💻 DISEÑO PARA WEB
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text("Usuario:", style: TextStyle(fontSize: 20)),
                            SizedBox(height: 45),
                            Text("Contraseña:", style: TextStyle(fontSize: 20)),
                          ],
                        ),

                        const SizedBox(width: 10),

                        Column(
                          children: [
                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller: _usercontroller,
                                decoration: InputDecoration(
                                  hintText: "Ingrese su usuario",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              width: 250,
                              child: TextField(
                                controller: _passworcontroller,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su contraseña',
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
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
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
              onPressed: () async {

                  

                login();
                final usuarioProvider = context.read<UsuariosProvider>();

                try {
                  final user = await usuarioProvider.validarLogin(
                    _usercontroller.text.trim(),
                    _passworcontroller.text.trim(),
                  );

                  if (user != null) {
                print(user);
                print(user.rol);

                    Navigator.pushReplacementNamed(
                      context,
                      user.rol.toLowerCase() == 'admin'
                          ? '/adminHome'
                          : '/trabajadorHome',
                    );
                  }
                } catch (e) {
                  mostrarMensajeFlotante(context, e.toString());
                }
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
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
              color: Colores.secondary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10),
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
