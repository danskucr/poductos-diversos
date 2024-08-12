import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProductosProvider extends ChangeNotifier{

  bool isLoading = true;
  String error = '';

  ProductosResponse autos = ProductosResponse(data: []);
  ProductosResponse inmuebles = ProductosResponse(data: []);
  ProductosResponse electronicos = ProductosResponse(data: []);

  List<Producto> productoAutos = [];
  List<Producto> productoInmuebles = [];
  List<Producto> productoElectronicos = [];

  getNext() async {


  }

  getAutos() async {
    try {
      
      final String response = await rootBundle.loadString('assets/data/autos.json');
      autos = ProductosResponse.fromJson(json.decode(response));

      productoAutos.addAll(autos.data);
      notifyListeners();

    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();

  }

  getInmuebles() async {
    try {
      final String response = await rootBundle.loadString('assets/data/inmuebles.json');

      inmuebles = ProductosResponse.fromJson(json.decode(response));
      productoInmuebles.addAll(inmuebles.data);
      notifyListeners();

    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();

  }
  getElectronicos() async {
    try {
      final String response = await rootBundle.loadString('assets/data/electronicos.json');

      electronicos = ProductosResponse.fromJson(json.decode(response));

      productoElectronicos.addAll(electronicos.data);
      notifyListeners();

    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();

  }
}

  // (List<Producto>, int, int)  _getRequestParams(List<Producto> producto, int inicio, int fin) {
  //   List<Producto> productoNew = [];

  //   for (var i = inicio; i < fin; i++) {
  //     productoNew.add(producto[i]);
  //   }

  //   return (productoNew, productoNew.first.idProducto, productoNew.first.idProducto);
  // }















