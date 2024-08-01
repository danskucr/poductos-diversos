import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/text_constants.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/detalle_anuncio/detalle_descripcion.dart';

import '../../../constants/colors/palette.dart';
import '../../../utils/bottom_navigation.dart';
import '../../carrito_compras/pages/carrito_compras_pages.dart';
import '../../favoritos/pages/favoritos_page.dart';
import '../../home/pages/home_page.dart';
import '../widgets/detalle_anuncio/carousel_image.dart';
import 'anuncios_page.dart';

class DetalleAnuncioPage extends StatefulWidget {
  const DetalleAnuncioPage({super.key});

  @override
  State<DetalleAnuncioPage> createState() => _DetalleAnuncioPageState();
}

class _DetalleAnuncioPageState extends State<DetalleAnuncioPage> {

  TextConstants textConstants = TextConstants();

  int position = 0;
  ColorsPalette colorsPalette = ColorsPalette();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(textConstants.detalleAnuncio),),
      backgroundColor: colorsPalette.whitePD,
      // bottomNavigationBar:  bottomNavigationBar(_onItemTapped, position),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetalleDescripcion(),
            ElevatedButton(
              onPressed: (){},
              child: Text('Contactar al vendedor')
            )
          ],
        ),
      )
    );
  }
}