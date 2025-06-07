import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          // Título "Preparate ICFES Caribe" en la parte superior
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15, // Ajusta la posición vertical
            left: 0,
            right: 0,
            child: Text(
              'Preparate ICFES\nCaribe',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: primaryBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: primaryBackground,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              width: MediaQuery.of(context).size.width * 30,
              height: MediaQuery.of(context).size.height * 0.80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Inicia sesion para mayor contenido.',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                      ),
                      const SizedBox(height: 30),
                      // Campo de Email
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo de Contraseña
                      TextField(
                        obscureText: true, // Para ocultar la contraseña
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey), // Icono de ojo
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Botón Iniciar Sesión
                      ElevatedButton(
                        onPressed: () {
                          // Lógica de inicio de sesión aquí
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50), // Ancho completo
                          backgroundColor: primaryColor, // Color verde del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Iniciar Sesión',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: primaryBackground,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'O inicia sesión con:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                      ),
                      const SizedBox(height: 20),
                      // Botón Continue with Google
                      OutlinedButton.icon(
                        onPressed: () {
                          // Lógica para iniciar sesión con Google
                        },
                        icon: Image.asset('assets/img/9187604.png', height: 24), // Asegúrate de tener esta imagen
                        label: Text(
                          'Continue with Google',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.grey.shade800,
                              ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Botón Continue with Apple
                      OutlinedButton.icon(
                        onPressed: () {
                          // Lógica para iniciar sesión con Apple
                        },
                        icon: const Icon(Icons.apple, color: Colors.black, size: 28), // Icono de Apple
                        label: Text(
                          'Continue with Apple',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.grey.shade800,
                              ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Texto "Sign Up here"
                      TextButton(
                        onPressed: () {
                          // Lógica para navegar a la pantalla de registro
                        },
                        child: Text(
                          'Sign Up here',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}