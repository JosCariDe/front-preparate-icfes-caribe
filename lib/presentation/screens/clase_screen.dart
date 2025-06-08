import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:caribe_app/domain/entities/clase_icfes.dart'; // Importa el modelo ClaseICFES
import 'package:caribe_app/domain/entities/simulacro.dart'; // Importa el modelo Simulacro
import 'package:caribe_app/domain/entities/foro.dart'; // Importa el modelo Foro

class ClaseScreen extends StatefulWidget {
  final ClaseICFES clase; // Añade esta propiedad

  const ClaseScreen({super.key, required this.clase}); // Añade el constructor

  @override
  State<ClaseScreen> createState() => _ClaseScreenState();
}

class _ClaseScreenState extends State<ClaseScreen> {
  // Estado para el selector de pestañas
  Set<String> _selectedTab = <String>{'Pendiente'};

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surfaceContainerHighest,
      appBar: _AppBarClasesICFES(clase: widget.clase), // Pasa la clase al AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SelectorPestanias(
              selectedTab: _selectedTab,
              onSelectionChanged: (newSelection) {
                setState(() {
                  _selectedTab = newSelection;
                });
              },
            ),
            // Condicionalmente muestra la lista de simulacros o foros
            if (_selectedTab.contains('Pendiente') || _selectedTab.contains('Completado'))
              _ListSimulacros(
                simulacros: widget.clase.simulacros ?? [], // Asegura que siempre sea una lista no nula
                filterStatus: _selectedTab.first, // Pasa el estado seleccionado
              )
            else // Si tuvieras una pestaña de foros, la mostrarías aquí
              const SizedBox.shrink(), // O un widget para foros
          ],
        ),
      ),
    );
  }
}

class _ListSimulacros extends StatelessWidget {
  final List<Simulacro> simulacros; // Recibe la lista de simulacros
  final String filterStatus; // Recibe el estado para filtrar ('Pendiente' o 'Completado')

  const _ListSimulacros({
    super.key,
    required this.simulacros,
    required this.filterStatus,
  });

  @override
  Widget build(BuildContext context) {
    // Filtra los simulacros según el estado seleccionado
    final filteredSimulacros = simulacros.where((s) {
      if (filterStatus == 'Pendiente') {
        return s.estado != 'completado'; // Muestra los que no están completados
      } else if (filterStatus == 'Completado') {
        return s.estado == 'completado'; // Muestra solo los completados
      }
      return true; // Si no hay filtro específico, muestra todos (o ajusta según necesidad)
    }).toList();

    if (filteredSimulacros.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('No hay simulacros en esta categoría.'),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredSimulacros.length, // Usa la lista filtrada
      itemBuilder: (context, index) {
        final simulacro = filteredSimulacros[index]; // Accede al simulacro filtrado

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Sombra más suave
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            simulacro.titulo, // ¡Dinámico!
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${simulacro.listaOpcionesEscogidas?.length} de ${simulacro.listaIdPreguntas?.length} preguntas respondidas', // ¡Dinámico!
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Icon(Icons.radio_button_unchecked, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 7.5),
                  Divider(),
                  SizedBox(height: 7.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        simulacro.estado == 'pendiente' ? 'Disponible hasta: --/--' : 'Completado el: --/--', // Ajusta la fecha si la tienes
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: simulacro.estado == 'pendiente' ? Colors.green.shade700 : Colors.grey,
                            ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: simulacro.estado == 'en progreso'
                              ? const Color(0xFFD4AF37) // Amarillo para "In Progress"
                              : simulacro.estado == 'completado'
                                  ? const Color(0xFFB06D80) // Morado para "Completado"
                                  : Colors.grey, // Gris para "Pendiente"
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          simulacro.estado == 'en progreso'
                              ? 'In Progress'
                              : simulacro.estado == 'completado'
                                  ? 'Completado'
                                  : 'Entrar', // O "Iniciar" para pendiente
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Colors.white,
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
    );
  }
}

class _SelectorPestanias extends StatefulWidget {
  final Set<String> selectedTab; // Recibe el estado
  final ValueChanged<Set<String>> onSelectionChanged; // Callback para notificar cambios

  const _SelectorPestanias({
    super.key,
    required this.selectedTab,
    required this.onSelectionChanged,
  });

  @override
  State<_SelectorPestanias> createState() => _SelectorPestaniasState();
}

class _SelectorPestaniasState extends State<_SelectorPestanias> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Align(
        child: SegmentedButton<String>(
          segments: const <ButtonSegment<String>>[
            ButtonSegment<String>(value: 'Pendiente', label: Text('Pendiente')),
            ButtonSegment<String>(
              value: 'Completado',
              label: Text('Completado'),
            ),
          ],
          selected: widget.selectedTab, // Usa el estado recibido
          onSelectionChanged: widget.onSelectionChanged, // Usa el callback
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.white,
            selectedBackgroundColor: const Color.fromARGB(255, 103, 146, 89),
            selectedForegroundColor: Theme.of(context).colorScheme.onPrimary,
            foregroundColor: Colors.grey.shade700,
            side: BorderSide(color: primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarClasesICFES extends StatelessWidget implements PreferredSizeWidget {
  final ClaseICFES clase; // Añade esta propiedad

  const _AppBarClasesICFES({super.key, required this.clase}); // Añade el constructor

  @override
  Size get preferredSize => const Size.fromHeight(180);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AppBar(
      automaticallyImplyLeading: false, // Added to prevent the extra back arrow
      backgroundColor: primaryColor,
      toolbarHeight: 180,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: colors.onPrimary),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                clase.nombreClase, // ¡Ahora es dinámico!
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '${clase.foros!.length + clase.simulacros!.length} miembros', // Ejemplo dinámico de miembros
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colors.onPrimary),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 25, color: Colors.grey),
                      ),
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-20, 0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: colors.onPrimary, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
