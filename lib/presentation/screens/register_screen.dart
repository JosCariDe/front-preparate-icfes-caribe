import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/presentation/screens/home_screen.dart';
import 'package:caribe_app/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:caribe_app/config/theme/app_theme.dart'; // Importa el tema para primaryColor
import 'package:provider/provider.dart';
import 'package:caribe_app/presentation/providers/estudiante_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _municipalityController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  bool _isPasswordVisible =
      false; // Estado para la visibilidad de la contraseña

  final _formKey = GlobalKey<FormState>(); // Clave para el formulario

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _departmentController.dispose();
    _municipalityController.dispose();
    _gradeController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final estudianteProvider = Provider.of<EstudianteProvider>(
      context,
      listen: false,
    );
    final success = await estudianteProvider.register(
      _fullNameController.text,
      _emailController.text,
      _passwordController.text,
      _departmentController.text,
      _municipalityController.text,
      _gradeController.text,
    );

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              '¡Registro exitoso! Redirigiendo a la pantalla principal...',
            ),
            backgroundColor: Colors.green,
          ),
        );
        // Esperar 3 segundos antes de navegar
        await Future.delayed(const Duration(seconds: 3));

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              estudianteProvider.errorMessage ??
                  'Error desconocido al registrar usuario',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.10, // Ajustado para el título de registro
            left: 0,
            right: 0,
            child: Text(
              'Crea tu cuenta\nICFES Caribe', // Título para la pantalla de registro
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: colors.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.25, // Ajustado para el contenido
            left: 20,
            right: 20,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    // Envuelve los campos en un Form
                    key: _formKey, // Asigna la clave al formulario
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Regístrate para acceder a todo el contenido.', // Mensaje introductorio
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 30),
                        // Campo de Nombre Completo
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            hintText: 'Nombre Completo',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu nombre completo';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo de Correo
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Correo',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu correo';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Ingresa un correo válido (ej. usuario@dominio.com)';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo de Contraseña
                        TextFormField(
                          controller: _passwordController,
                          obscureText:
                              !_isPasswordVisible, // Controla la visibilidad
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
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa una contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo de Departamento
                        TextFormField(
                          controller: _departmentController,
                          decoration: InputDecoration(
                            hintText: 'Departamento',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu departamento';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo de Municipio
                        TextFormField(
                          controller: _municipalityController,
                          decoration: InputDecoration(
                            hintText: 'Municipio',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu municipio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo de Grado
                        TextFormField(
                          controller: _gradeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Grado',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu grado';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Ingresa un número válido para el grado';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        // Botón Registrar
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Valida el formulario
                              // Lógica para registrar usuario (placeholder)
                              _register();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Formulario validado correctamente',
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: colors.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Registrar',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              color: colors.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            ); // Navegar de vuelta a la pantalla de login
                          },
                          child: Text(
                            '¿Ya tienes una cuenta? Inicia sesión aquí',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
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
          ),
        ],
      ),
    );
  }
}
