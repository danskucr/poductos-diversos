
import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/text_constants.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/anuncios/anuncios_item.dart';

class AnunciosPage extends StatefulWidget {
  const AnunciosPage({super.key});

  @override
  State<AnunciosPage> createState() => _AnunciosPageState();
}

class _AnunciosPageState extends State<AnunciosPage> with SingleTickerProviderStateMixin {

  TextConstants textConstants = TextConstants();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(textConstants.buscadorAnuncio),
        tabBar()
      ],
    );
  }
Widget tabBar(){
  return DefaultTabController(
    initialIndex: 0,
    length: 3,
    child: Builder( // Add this
      builder: (context) {
        return Column(
          children: [
            TabBar(
              controller: DefaultTabController.of(context),
              labelColor: Colors.black,
              tabs: [
                Tab(text: textConstants.autos),
                Tab(text: textConstants.inmuebles),
                Tab(text: textConstants.electronicos),
              ],
            ),
            Center(
              // child: OutlinedButton(
              //   child: Text('Three'),
              //   onPressed: (){
              //     DefaultTabController.of(context)?.animateTo(2);
              //   },
              // ),
              child: AnunciosItem(),
            )
          ],
        );
      }
    ),
  );
        
}
}

