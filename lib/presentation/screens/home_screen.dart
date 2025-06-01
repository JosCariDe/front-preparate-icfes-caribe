import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! INFORMACION DEL USER
            InforUser(),
            //! BARRA DE BUSQUEDA
            BarraBusqueda(),
            //TODO SECCION CLASES ICFES
            const SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'CLASES ICFES DISPONIBLES',
                style: TextStyle(
                  color: primaryText,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ClasesICFES(),
            //TODO SECCION AVANCE
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mi Avance',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SeccionAvance(),
          ],
        ),
      ),
    );
  }
}

class SeccionAvance extends StatelessWidget {
  const SeccionAvance({
    super.key,
  });

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
            tabs: const [
              Tab(text: 'Foros',),
              Tab(text: 'Simulacros',),
            ],
          ),
          SizedBox(
            height: 180,
            child: TabBarView(
              children: [
                //? PESTAÑA FOROS:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: secondaryBackground,
                      border: Border.all(
                        width: 2.8,
                        color: primaryColor
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aportaciones como jovenes a la sociedad',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700  
                            ),
                          ),
                          Text(
                            'Creado por: Lic. Maria Marcela',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300  
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: primaryColor,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Creado el 12/05/25',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  color: primaryColor,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: secondaryColor,
                                ),
                                onPressed: () {}, 
                                child: Text('Entrar',
                                  style: TextStyle(
                                    color:Colors.white,
                                  )
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ClasesICFES extends StatelessWidget {
  const ClasesICFES({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // ? 3 Tarjeatas de ejemplo
        itemBuilder: (context, index) {
          return Container(
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
                  offset: Offset(0, 3)
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.monitor,
                    size: 40,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'Normal 11-B',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,),
                    
                  ),
                  Text(
                    '2 SImulacros Pendiente',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,),
                    
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 20, color: Colors.grey,),
                      ),
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blueGrey,
                          child: Icon(Icons.person, size: 20, color: Colors.grey),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-20, 0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 20, color: Colors.grey),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-30, 0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blueGrey,
                          child: Icon(Icons.person, size: 20, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BarraBusqueda extends StatelessWidget {
  const BarraBusqueda({
    super.key,
  });

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
              color: Colors.grey.withOpacity(0.3),
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
            fillColor: Colors.transparent, // Set to transparent as container provides the color
            border: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none //? SIN BORDE VISIBLE
            ),
            contentPadding: 
              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),
      ),
    );
  }
}

class InforUser extends StatelessWidget {
  const InforUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.person,
              size: 40,
              color: secondaryBackground,
            ),
          ),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jose Narvaez',
                style: TextStyle(
                  color: primaryText
                ),
              ),
              Text(
                'Listo para el 400 REY',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          )
        ],
      ),
      
      );
  }
}
