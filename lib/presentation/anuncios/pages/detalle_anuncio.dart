import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/text_constants.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:productos_diversos/presentation/anuncios/pages/contacto_page.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/detalle_anuncio/detalle_descripcion.dart';

import '../../../constants/colors/palette.dart';
import '../widgets/detalle_anuncio/carousel_image.dart';

class DetalleAnuncioPage extends StatefulWidget {
  Producto producto;
  DetalleAnuncioPage({super.key, required this.producto});

  @override
  State<DetalleAnuncioPage> createState() => _DetalleAnuncioPageState();
}

class _DetalleAnuncioPageState extends State<DetalleAnuncioPage> {

  TextConstants textConstants = TextConstants();
  ColorsPalette colorsPalette = ColorsPalette();

  int position = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, 
      appBar: AppBar(title: Text(textConstants.detalleAnuncio), backgroundColor: ColorsPalette().whitePD),
      backgroundColor: colorsPalette.whitePD,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CarouselImage(producto: widget.producto),
                DetalleDescripcion(producto: widget.producto),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorsPalette.blueDarkPD,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ContactoPage(),)
                );
              },
              child: Text('Contactar al vendedor', style: TextStyles().ubuntu16But,)
            )
          ],
        ),
      )
    );
  }
}