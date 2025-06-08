import 'package:caribe_app/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:caribe_app/presentation/providers/estudiante_provider.dart';
import 'package:caribe_app/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final estudianteProvider = Provider.of<EstudianteProvider>(context, listen: false);
    final success = await estudianteProvider.login(
      _emailController.text,
      _passwordController.text,
    );

    if (success) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(estudianteProvider.errorMessage ?? 'Error desconocido al iniciar sesión'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final estudianteProvider = context.watch<EstudianteProvider>(); // Escucha cambios en el provider

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            right: 0,
            child: Text(
              'Preparate ICFES\nCaribe',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 20,
            right: 20,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible, // Controla la visibilidad
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Botón Iniciar Sesión
                      estudianteProvider.isLoading
                          ? const CircularProgressIndicator() // Muestra un indicador de carga
                          : ElevatedButton(
                              onPressed: _login, // Llama a la función _login
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: colors.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Iniciar Sesión',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: colors.onSecondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                      if (estudianteProvider.errorMessage != null) // Muestra mensaje de error
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            estudianteProvider.errorMessage!,
                            style: const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
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
                      OutlinedButton.icon(
                        onPressed: () {
                          // Lógica para iniciar sesión con Google
                        },
                        icon: Image.asset('assets/img/9187604.png', height: 24),
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
                      OutlinedButton.icon(
                        onPressed: () {
                          // Lógica para iniciar sesión con Apple
                        },
                        icon: const Icon(Icons.apple, color: Colors.black, size: 28),
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())); 
                        },
                        child: Text(
                          'Registrate aquí rey',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
