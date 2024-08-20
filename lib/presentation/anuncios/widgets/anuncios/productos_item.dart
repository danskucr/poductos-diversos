import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/Text/currency_format.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/API/provider/productos.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:productos_diversos/presentation/anuncios/pages/detalle_page.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  fit: BoxFit.fitHeight,
                  width: 70,
                  height: 100,
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
                        Text( numberFormat.format(widget.producto.precio), style: TextStyles().ubuntu16M,)
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
class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 50, 180);
  }
  
  @override
  bool shouldReclip (covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}