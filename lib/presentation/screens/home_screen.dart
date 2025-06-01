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
            SizedBox(
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
                                  backgroundColor: Colors.white,
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
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
            //TODO SECCION AVANCE
          ],
        ),
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
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Encuentra tu actividad!!',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,  //? COLOR DE RELLENO
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none //? SIN BORDE VISIBLE
          ),
          contentPadding: 
            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
