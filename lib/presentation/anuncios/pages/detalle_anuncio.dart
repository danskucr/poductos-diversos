import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/text_constants.dart';

import '../widgets/detalle_anuncio/carousel_image.dart';

class DetalleAnuncioPage extends StatefulWidget {
  const DetalleAnuncioPage({super.key});

  @override
  State<DetalleAnuncioPage> createState() => _DetalleAnuncioPageState();
}

class _DetalleAnuncioPageState extends State<DetalleAnuncioPage> {

  TextConstants textConstants = TextConstants();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(textConstants.detalleAnuncio),
            CarouselImage()
          ],
        ),
      )
    );
  }
}