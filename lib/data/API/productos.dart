import 'dart:convert';

import 'package:productos_diversos/data/models/productos/productos_response.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProductosData {
  Future<ProductosResponse> getAutos(tipo) async {
    var data = await rootBundle.loadString('assets/data/autos.json');
    ProductosResponse autosResponse = json.decode(data);
    return autosResponse;
  }
  Future<ProductosResponse> getInmuebles() async {
    var data = await rootBundle.loadString('assets/data/inmuebles.json');
    ProductosResponse autosResponse = json.decode(data);
    return autosResponse;
  }
  Future<ProductosResponse> getElectronicos() async {
    var data = await rootBundle.loadString('assets/data/electronicos.json');
    ProductosResponse autosResponse = json.decode(data);
    return autosResponse;
  }  
}