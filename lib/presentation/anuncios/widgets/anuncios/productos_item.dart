import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/API/provider/productos.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:productos_diversos/presentation/anuncios/pages/detalle_anuncio.dart';
import 'package:provider/provider.dart';

class ProductosItem extends StatefulWidget {
  Producto producto;
  ProductosItem({super.key, required this.producto});

  @override
  State<ProductosItem> createState() => _ProductosItemState();
}

class _ProductosItemState extends State<ProductosItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetalleAnuncioPage(producto: widget.producto))
        )
      ),
      child: Card(
        color: ColorsPalette().greyPD,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                image: NetworkImage(
                    widget.producto.imagen[0]
                    )
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.producto.titulo, style: TextStyles().ubuntu16B,),
                        Text(widget.producto.precio.toString(), style: TextStyles().ubuntu16M,)
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(widget.producto.descripcion, style: TextStyles().ubuntu14M,)
                  ],
                ),
              ),
            ],
          ),
        )),
    );
  }
}