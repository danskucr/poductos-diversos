import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/presentation/anuncios/pages/anuncios_page.dart';
import 'package:productos_diversos/presentation/carrito_compras/pages/carrito_compras_pages.dart';
import 'package:productos_diversos/presentation/favoritos/pages/favoritos_page.dart';
import 'package:productos_diversos/presentation/home/pages/home_page.dart';
import 'package:productos_diversos/presentation/perfil/pages/perfil_page.dart';
import 'package:productos_diversos/utils/bottom_navigation.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int position = 0;
  ColorsPalette colorsPalette = ColorsPalette();
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CarritoComprasPage(),
    AnunciosPage(),
    FavoritosPage(),
    PerfilPage()
  ];
  static const List<String> _textOptions = <String>[
    'Home',
    'Carrito',
    'Buscador Anuncio',
    'Favoritos',
    'Perfil'
  ];
  void _onItemTapped(int index) {
    setState(() {
      position = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(_textOptions[position])
      ),
      backgroundColor: colorsPalette.whitePD,
      body: Center(
        child: _widgetOptions.elementAt(position),
      ),
      bottomNavigationBar:  bottomNavigationBar(_onItemTapped, position)
    );
  }
}