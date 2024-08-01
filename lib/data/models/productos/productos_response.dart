// To parse this JSON data, do
//
//     final productosResponse = productosResponseFromJson(jsonString);

import 'dart:convert';

ProductosResponse productosResponseFromJson(String str) => ProductosResponse.fromJson(json.decode(str));

String productosResponseToJson(ProductosResponse data) => json.encode(data.toJson());

class ProductosResponse {
    List<Datum> data;

    ProductosResponse({
        required this.data,
    });

    factory ProductosResponse.fromJson(Map<String, dynamic> json) => ProductosResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String titulo;
    int tipo;
    int precio;
    String imagen;
    String longitud;
    String latitud;
    String descripcion;

    Datum({
        required this.titulo,
        required this.tipo,
        required this.precio,
        required this.imagen,
        required this.longitud,
        required this.latitud,
        required this.descripcion,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        titulo: json["titulo"],
        tipo: json["tipo"],
        precio: json["precio"],
        imagen: json["imagen"],
        longitud: json["longitud"],
        latitud: json["latitud"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "tipo": tipo,
        "precio": precio,
        "imagen": imagen,
        "longitud": longitud,
        "latitud": latitud,
        "descripcion": descripcion,
    };
}
