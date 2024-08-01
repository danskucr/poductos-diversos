import 'package:flutter/material.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/detalle_anuncio/carousel_image.dart';

class DetalleDescripcion extends StatelessWidget {
  const DetalleDescripcion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mazda'),
                Text('\$ 360,000')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                recomendacion(),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Mapa')
                )
              ],
            )
          ],
        ),
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