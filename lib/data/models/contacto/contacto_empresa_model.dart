import 'dart:convert';

ContactoEmpresaResponse contactoEmpresaResponseFromJson(String str) => ContactoEmpresaResponse.fromJson(json.decode(str));

String contactoEmpresaResponseToJson(ContactoEmpresaResponse data) => json.encode(data.toJson());

class ContactoEmpresaResponse {
    int idContacto;
    String nombre;
    String numero;
    String email;

    ContactoEmpresaResponse({
        required this.idContacto,
        required this.nombre,
        required this.numero,
        required this.email,
    });

    factory ContactoEmpresaResponse.fromJson(Map<String, dynamic> json) => ContactoEmpresaResponse(
        idContacto: json["id_contacto"],
        nombre: json["nombre"],
        numero: json["numero"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id_contacto": idContacto,
        "nombre": nombre,
        "numero": numero,
        "email": email,
    };
}
