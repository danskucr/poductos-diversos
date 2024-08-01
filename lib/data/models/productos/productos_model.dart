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
    int idProducto;
    String titulo;
    int tipo;
    int precio;
    List<Imagen> imagen;
    String longitud;
    String latitud;
    String descripcion;

    Datum({
        required this.idProducto,
        required this.titulo,
        required this.tipo,
        required this.precio,
        required this.imagen,
        required this.longitud,
        required this.latitud,
        required this.descripcion,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProducto: json["id_producto"],
        titulo: json["titulo"],
        tipo: json["tipo"],
        precio: json["precio"],
        imagen: List<Imagen>.from(json["imagen"].map((x) => Imagen.fromJson(x))),
        longitud: json["longitud"],
        latitud: json["latitud"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id_producto": idProducto,
        "titulo": titulo,
        "tipo": tipo,
        "precio": precio,
        "imagen": List<dynamic>.from(imagen.map((x) => x.toJson())),
        "longitud": longitud,
        "latitud": latitud,
        "descripcion": descripcion,
    };
}

class Imagen {
    int posicion;
    String url;

    Imagen({
        required this.posicion,
        required this.url,
    });

    factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        posicion: json["posicion"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "posicion": posicion,
        "url": url,
    };
}
