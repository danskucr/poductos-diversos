import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/detalle_anuncio/carousel_image.dart';

import '../../../../constants/Text/text_constants.dart';
import '../../../../constants/colors/palette.dart';
import '../../pages/contacto_page.dart';

class DetalleDescripcion extends StatefulWidget {
  const DetalleDescripcion({super.key});

  @override
  State<DetalleDescripcion> createState() => _DetalleDescripcionState();
}

class _DetalleDescripcionState extends State<DetalleDescripcion> {
  TextConstants textConstants = TextConstants();

  ColorsPalette colorsPalette = ColorsPalette();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CarouselImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Mazda', style: TextStyles().ubuntu22M,),
            recomendacion(),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$ 360,000'),
            ElevatedButton(
              onPressed: (){
            
              },
              child: Text('Mapa', style: TextStyles().ubuntu12But,),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorsPalette.blueDarkPD,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              )
            )
          ],
        ),
        SizedBox(height: 10,),
        Text('Lorem Ipsum is simply dummy text of the printi')
      ],
    );
  }

  Widget recomendacion() {
    return Row(
      children: [
        Icon(Icons.star_border),
        Text(' 4.8 '),
        Text(' 10 reviews ')
      ],
    );
  }
}