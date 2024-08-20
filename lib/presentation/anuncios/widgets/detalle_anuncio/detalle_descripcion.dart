import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/currency_format.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:productos_diversos/presentation/anuncios/pages/maps_page.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/detalle_anuncio/carousel_image.dart';

import '../../../../constants/Text/text_constants.dart';
import '../../../../constants/colors/palette.dart';
import '../../pages/contacto_page.dart';

class DetalleDescripcion extends StatefulWidget {
  Producto producto;
  DetalleDescripcion({super.key, required this.producto});

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
            Text(widget.producto.titulo, style: TextStyles().ubuntu22M,),
            recomendacion(),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text( numberFormat.format(widget.producto.precio)),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  MapsPage(latitude: double.parse(widget.producto.latitud) , longitude: double.parse(widget.producto.longitud)))
                );            
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
        Text(widget.producto.descripcion, style: TextStyles().ubuntu16M,)
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