// To parse this JSON data, do
//
//     final contactoEmpresaResponse = contactoEmpresaResponseFromJson(jsonString);

import 'dart:convert';

ContactoEmpresaResponse contactoEmpresaResponseFromJson(String str) => ContactoEmpresaResponse.fromJson(json.decode(str));

String contactoEmpresaResponseToJson(ContactoEmpresaResponse data) => json.encode(data.toJson());

class ContactoEmpresaResponse {
    int idContacto;
    String nombre;
    String telefono;
    String email;
    String imagen;

    ContactoEmpresaResponse({
        required this.idContacto,
        required this.nombre,
        required this.telefono,
        required this.email,
        required this.imagen,
    });

    factory ContactoEmpresaResponse.fromJson(Map<String, dynamic> json) => ContactoEmpresaResponse(
        idContacto: json["id_contacto"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        email: json["email"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id_contacto": idContacto,
        "nombre": nombre,
        "telefono": telefono,
        "email": email,
        "imagen": imagen,
    };
}
