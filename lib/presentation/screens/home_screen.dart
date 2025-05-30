import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _UserInfoSection(),
                const SizedBox(height: 20),
                _SearchBar(),
                const SizedBox(height: 20),
                _ClassesSection(),
                const SizedBox(height: 20),
                _MyProgressSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  const _UserInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue.shade200,
          child: Icon(Icons.person, size: 30, color: Colors.white),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jose Narvaez',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Listo para el 400 en el ICFES',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Encuentra tu actividad',
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}

class _ClassesSection extends StatelessWidget {
  const _ClassesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Clases ICFES en la que haces parte',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFB06D82), // Approximate color from image
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.monitor, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                'Normal 11-B',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '2 Simulacros Pendiente',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/img/9187604.png')), // Placeholder image
                  Transform.translate(
                    offset: Offset(-10, 0),
                    child: CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/img/9187604.png')), // Placeholder image
                  ),
                  Transform.translate(
                    offset: Offset(-20, 0),
                    child: CircleAvatar(radius: 15, backgroundImage: AssetImage('assets/img/9187604.png')), // Placeholder image
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MyProgressSection extends StatelessWidget {
  const _MyProgressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mi avance',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Foros'),
                  Tab(text: 'Simulacros'),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 200, // Adjust height as needed
                child: TabBarView(
                  children: [
                    // Foros Tab Content (Card)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aportación como jovenes a la sociedad.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Creado Por: Lic. Maria Marcela',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Credo el 12/05/25',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB06D82), // Approximate color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                                ),
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Simulacros Tab Content (can be similar or different)
                    Center(child: Text('Contenido de Simulacros')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
