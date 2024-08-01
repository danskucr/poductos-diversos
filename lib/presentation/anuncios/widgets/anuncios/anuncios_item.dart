import 'package:flutter/material.dart';
import 'package:productos_diversos/presentation/anuncios/pages/detalle_anuncio.dart';

class AnunciosItem extends StatelessWidget {
  const AnunciosItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetalleAnuncioPage(),)
        )
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                image: NetworkImage(
                    'https://i.pinimg.com/236x/0d/86/2a/0d862a94f0ec9a639922f60f88e096f2.jpg'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Montañas'),
                        Text('200')
                      ],
                    ),
                    Text('data')
                  ],
                ),
              ),
            ],
          ),
        )),
    );
  }
}