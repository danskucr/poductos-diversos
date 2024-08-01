import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/presentation/anuncios/pages/anuncios_page.dart';
import 'package:productos_diversos/presentation/anuncios/pages/detalle_anuncio.dart';
import 'package:productos_diversos/presentation/carrito_compras/pages/carrito_compras_pages.dart';
import 'package:productos_diversos/presentation/favoritos/pages/favoritos_page.dart';
import 'package:productos_diversos/presentation/home/pages/home_page.dart';
import 'package:productos_diversos/presentation/perfil/pages/perfil_page.dart';

class BottomNavigationPD extends StatefulWidget {
  const BottomNavigationPD({super.key});

  @override
  State<BottomNavigationPD> createState() => _BottomNavigationPDState();
}

class _BottomNavigationPDState extends State<BottomNavigationPD> {
  int position = 0;
  ColorsPalette colorsPalette = ColorsPalette();
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CarritoComprasPage(),
    AnunciosPage(),
    FavoritosPage(),
    DetalleAnuncioPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      position = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: colorsPalette.whitePD,
      body: Center(
        child: _widgetOptions.elementAt(position),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorsPalette.blueDarkPD,
        // fixedColor: colorsPalette.whitePD,
        useLegacyColorScheme: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscador'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
    ],
    onTap: _onItemTapped,
    currentIndex: position,), 
    );
  }
}