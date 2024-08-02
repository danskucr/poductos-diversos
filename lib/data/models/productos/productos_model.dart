// To parse this JSON data, do
//
//     final productosResponse = productosResponseFromJson(jsonString);

import 'dart:convert';

ProductosResponse productosResponseFromJson(String str) => ProductosResponse.fromJson(json.decode(str));

String productosResponseToJson(ProductosResponse data) => json.encode(data.toJson());

class ProductosResponse {
    List<Producto> data;

    ProductosResponse({
        required this.data,
    });

    factory ProductosResponse.fromJson(Map<String, dynamic> json) => ProductosResponse(
        data: List<Producto>.from(json["data"].map((x) => Producto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Producto {
    int idProducto;
    String titulo;
    int tipo;
    int precio;
    List<String> imagen;
    String longitud;
    String latitud;
    String descripcion;

    Producto({
        required this.idProducto,
        required this.titulo,
        required this.tipo,
        required this.precio,
        required this.imagen,
        required this.longitud,
        required this.latitud,
        required this.descripcion,
    });

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        idProducto: json["id_producto"],
        titulo: json["titulo"],
        tipo: json["tipo"],
        precio: json["precio"],
        imagen: List<String>.from(json["imagen"].map((x) => x)),
        longitud: json["longitud"],
        latitud: json["latitud"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id_producto": idProducto,
        "titulo": titulo,
        "tipo": tipo,
        "precio": precio,
        "imagen": List<dynamic>.from(imagen.map((x) => x)),
        "longitud": longitud,
        "latitud": latitud,
        "descripcion": descripcion,
    };
}
