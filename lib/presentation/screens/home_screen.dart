import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/domain/entities/estudiante.dart';
import 'package:caribe_app/presentation/screens/clase_screen.dart';
import 'package:caribe_app/presentation/widgets/_CardForo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa el paquete provider
import 'package:caribe_app/presentation/providers/estudiante_provider.dart'; // Importa tu provider
import 'package:caribe_app/presentation/screens/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //? Observar el estudianteProvider
    final estudianteProvider = context.watch<EstudianteProvider>();
    final estudiante = estudianteProvider.estudiante;

    if (estudianteProvider.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (estudianteProvider.errorMessage != null) {
      return Scaffold(
        body: Center(child: Text(estudianteProvider.errorMessage!)),
      );
    }

    if (estudiante == null) {
      return const Scaffold(
        body: Center(
          child: Text('No se ha cargado la informacion del estudiante'),
        ),
      );
    }

    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surfaceContainerHighest,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ),
                  );
                },
              ),
            ),
            //! INFORMACION DEL USER
            InforUser(estudiante: estudiante),
            //! BARRA DE BUSQUEDA
            BarraBusqueda(),
            //TODO SECCION CLASES ICFES
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'CLASES ICFES DISPONIBLES',
                style: TextStyle(color: primaryText),
              ),
            ),
            const SizedBox(height: 10),
            ClasesICFES(estudiante: estudiante),
            //TODO SECCION AVANCE
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mi Avance',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            SizedBox(height: 10),
            SeccionAvance(estudiante: estudiante),
          ],
        ),
      ),
    );
  }
}

class SeccionAvance extends StatelessWidget {
  final Estudiante estudiante;
  const SeccionAvance({super.key, required this.estudiante});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //? Numero de Pestaañas
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            tabs: const [Tab(text: 'Foros'), Tab(text: 'Simulacros')],
          ),
          SizedBox(
            height: 180,
            child: TabBarView(
              children: [
                //? PESTAÑA FOROS:
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      estudiante.clasesICFES!.isNotEmpty
                          ? estudiante.clasesICFES!.first.foros?.length
                          : 0,
                  itemBuilder: (context, i) {
                    if (estudiante.clasesICFES!.isEmpty)
                      return const SizedBox.shrink();
                    final foro = estudiante.clasesICFES!.first.foros?[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foro!.nombre, // ¡Dinámico!
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Creado Por: ${foro.creador}', // ¡Dinámico!
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Creado el ${foro.fecha.day}/${foro.fecha.month}/${foro.fecha.year}', // ¡Dinámico!
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: Colors.grey),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Acción al presionar el botón
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFB06D80),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Entrar',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge?.copyWith(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                // Contenido para la pestaña "Simulacros" (ahora dinámico)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      estudiante.clasesICFES!.isNotEmpty
                          ? estudiante.clasesICFES!.first.simulacros?.length
                          : 0,
                  itemBuilder: (context, i) {
                    if (estudiante.clasesICFES!.isEmpty)
                      return const SizedBox.shrink();
                    final simulacro =
                        estudiante.clasesICFES!.first.simulacros?[i];
                    final isPending = simulacro?.estado != 'completado';
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    simulacro!.titulo, // ¡Dinámico!
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Icon(
                                    Icons.radio_button_unchecked,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${simulacro.listaIdPreguntas?.length} Preguntas', // ¡Dinámico!
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isPending
                                        ? 'Disponible Hasta: --/--'
                                        : 'Comienza el: --/--', // Ajusta según tu lógica de fecha
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isPending
                                              ? const Color(0xFFD4AF37)
                                              : const Color(0xFFB06D80),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      simulacro.estado == 'en progreso'
                                          ? 'In Progress'
                                          : simulacro.estado, // ¡Dinámico!
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClasesICFES extends StatelessWidget {
  final Estudiante estudiante;

  const ClasesICFES({super.key, required this.estudiante});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            estudiante.clasesICFES?.length ?? 0, // ? 3 Tarjeatas de ejemplo
        itemBuilder: (context, index) {
          final clase = estudiante.clasesICFES?[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ClaseScreen(clase: clase)));
            },
            child: Container(
              width: 250,
              margin: EdgeInsets.only(left: index == 0 ? 20 : 10, right: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFB06D80), // Color de fondo de la tarjeta
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(111, 158, 158, 158),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.monitor, size: 40, color: primaryColor),
                    const SizedBox(height: 10),
                    Text(
                      clase!.nombreClase,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      '${clase.simulacros?.where((s) => s.estado != 'completado').length} Simulacros Pendiente',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blueGrey,
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-30, 0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blueGrey,
                            child: Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BarraBusqueda extends StatelessWidget {
  const BarraBusqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 158, 158, 158),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Encuentra tu actividad!!',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor:
                Colors
                    .transparent, // Set to transparent as container provides the color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none, //? SIN BORDE VISIBLE
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ),
    );
  }
}

class InforUser extends StatelessWidget {
  final Estudiante estudiante;
  const InforUser({super.key, required this.estudiante});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: primaryColor,
            child: Icon(Icons.person, size: 40, color: secondaryBackground),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                estudiante.nombreCompleto,
                style: TextStyle(color: primaryText),
              ),
              Text(
                'Grado: ${estudiante.grado ?? 'N/A'}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
