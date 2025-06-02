import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';


enum EstadoPrueba { activo, inactivo, pendiente, cerrado }

class CardForo extends StatelessWidget {
  final String tituloForo;
  final String creadorForo;
  final String fechaCreacion;
  final EstadoPrueba estadoPrueba;

  const CardForo({super.key, required this.tituloForo, required this.creadorForo, required this.fechaCreacion, required this.estadoPrueba});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: secondaryBackground,
        border: Border.all(width: 2.8, color: primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tituloForo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(
              'Creado por $creadorForo',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            Divider(height: 10, color: primaryColor),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  fechaCreacion,
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
                  child: Text('Entrar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}