import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ClaseScreen extends StatefulWidget {

  @override
  State<ClaseScreen> createState() => _ClaseScreenState();
}

class _ClaseScreenState extends State<ClaseScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor:
          colors
              .surfaceContainerHighest, // Un color de fondo suave para el cuerpo
      appBar: _AppBarClasesICFES(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Aquí irá el selector de pestañas (Pending/Completed)
            _SelectorPestanias(),
            //! Aquí irá la lista de simulacros/pruebas
            _ListSimulacros(),
          ],
        ),
      ),
    );
  }
}

class _ListSimulacros extends StatelessWidget {
  const _ListSimulacros({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        final isPending = index == 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
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
                          Text('Prueba de Matematicas'),
                          Text('19 de 20 preguntas respondidas'),
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
                      Text('Disponible hasta: --/--'),
                      ElevatedButton(onPressed: () {}, child: Text('Entrar')),
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
  @override
  State<_SelectorPestanias> createState() => _SelectorPestaniasState();
}

class _SelectorPestaniasState extends State<_SelectorPestanias> {
  Set<String> selected = <String>{'Pendiente'};
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
          selected: <String>{'Pendiente'}, //?
          onSelectionChanged: (Set<String> newSelection) {
            // Lógica para cambiar entre "Pending" y "Completed"
            // Esto se manejará con un StatefulWidget más adelante
            setState(() {
              selected = <String>{'Completado'};
            });
          },
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

class _AppBarClasesICFES extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(180); // Altura del AppBar

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: primaryColor, // Color verde del header
      toolbarHeight: 180, // Altura extendida para el contenido del header
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
                    // Acción para volver atrás
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Normal 11- B Simulacros',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '12 miembros',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: colors.onPrimary),
              ),
              const Spacer(), // Empuja los avatares hacia abajo
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
