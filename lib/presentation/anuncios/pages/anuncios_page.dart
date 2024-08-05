
import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/text_constants.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/API/provider/productos.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/anuncios/productos_item.dart';
import 'package:provider/provider.dart';

import '../widgets/anuncios/productos_list.dart';

class AnunciosPage extends StatefulWidget {
  const AnunciosPage({super.key});

  @override
  State<AnunciosPage> createState() => _AnunciosPageState();
}

class _AnunciosPageState extends State<AnunciosPage> with SingleTickerProviderStateMixin {
  
  late TabController tabController;
  TextConstants textConstants = TextConstants();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context) => ProductosProvider(),
      child: (
        Column(
          children: [
            tabBar()
          ],
        )
      )
    );
  }
Widget tabBar(){
  double screenHeight = MediaQuery.of(context).size.height;

  return DefaultTabController(
    initialIndex: 0,
    length: 3,
    child: Builder( // Add this
      builder: (context) {
        return Column(
          children: [
            TabBar(
              controller: tabController,
              labelStyle: TextStyles().ubuntu16M,
              labelColor: Colors.black,
              tabs: [
                Tab(text: textConstants.autos,),
                Tab(text: textConstants.inmuebles),
                Tab(text: textConstants.electronicos),
              ],
            ),
            Container(
              height: screenHeight * .75,
              child: TabBarView(
                controller: tabController,
                children: [
                Center(
                  child: ProductosList(position: 0,)
                ),
                Center(
                  child: ProductosList(position: 1,)
                ),
                Center(
                  child: ProductosList(position: 2,)
                ),
                         ]),
            )

            
          ],
        );
      }
    ),
  );
        
}
}

