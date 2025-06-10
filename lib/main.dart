import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/infrastructure/services/estudiante_service.dart';
import 'package:caribe_app/presentation/providers/estudiante_provider.dart';
import 'package:caribe_app/presentation/screens/clase_screen.dart';
import 'package:caribe_app/presentation/screens/home_screen.dart';
import 'package:caribe_app/presentation/screens/login_screen.dart';
import 'package:caribe_app/presentation/screens/register_screen.dart';
import 'package:caribe_app/presentation/screens/simulacro_screen.dart';
import 'package:caribe_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provee el EstudianteService
        Provider<EstudianteService>(
          create: (_) => EstudianteService(),
        ),
        // Provee el EstudianteProvider, dependiendo de EstudianteService
        ChangeNotifierProvider(
          create: (context) => EstudianteProvider(
            estudianteService: context.read<EstudianteService>(),
          )..loadEstudiantes(), // Carga los estudiantes al iniciar el provider
        ),
      ],
      child: MaterialApp(
        title: 'Caribe App',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(), // Asegúrate de que HomeScreen sea tu pantalla inicial
      ),
    );
  }
}
