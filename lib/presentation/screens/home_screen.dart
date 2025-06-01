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
            Padding(
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
              
              ),
            //! BARRA DE BIUSQUEDA
            //TODO SECCION CLASES ICFES
            //TODO SECCION AVANCE
          ],
        ),
      ),
    );
  }
}
