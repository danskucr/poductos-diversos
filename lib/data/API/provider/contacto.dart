import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_diversos/data/models/contacto/contacto_empresa_model.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class ContactoProvider extends ChangeNotifier{

  bool isLoading = true;
  String error = '';

  ContactoEmpresaResponse contacto = ContactoEmpresaResponse(idContacto: 0, nombre: '', telefono: '', email: '', imagen: '');


  
  getContacto() async {
    try {
      final String response = await rootBundle.loadString('assets/data/contacto.json');

      if (response != null) {
        contacto = ContactoEmpresaResponse.fromJson(json.decode(response));        
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