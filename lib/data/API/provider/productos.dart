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

  
  getAutos() async {
    try {
      final String response = await rootBundle.loadString('assets/data/autos.json');

      if (response != null) {
        autos = ProductosResponse.fromJson(json.decode(response));        
      }else{
        error = 'No hay registros';
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();

  }
  getInmuebles() async {
    try {
      final String response = await rootBundle.loadString('assets/data/inmuebles.json');

      if (response != null) {
        inmuebles = ProductosResponse.fromJson(json.decode(response));        
      }else{
        error = 'No hay registros';
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();

  }
  getElectronicos() async {
    try {
      final String response = await rootBundle.loadString('assets/data/electronicos.json');

      if (response != null) {
        electronicos = ProductosResponse.fromJson(json.decode(response));        
      }else{
        error = 'No hay registros';
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();

  }
}