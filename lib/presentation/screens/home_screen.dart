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
            Padding(
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
              )
            //TODO SECCION CLASES ICFES
            //TODO SECCION AVANCE
          ],
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
