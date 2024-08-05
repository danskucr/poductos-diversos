import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';

Widget bottomNavigationBar(Function(int)? _onItemTapped, int position) {
  return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscador'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
    ],
    onTap: _onItemTapped,
    currentIndex: position);
}