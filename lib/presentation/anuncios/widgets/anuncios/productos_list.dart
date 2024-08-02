import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/models/productos/productos_model.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/anuncios/productos_item.dart';
import 'package:provider/provider.dart';

import '../../../../data/API/provider/productos.dart';

class ProductosList extends StatefulWidget {
  int position;
  ProductosList({super.key, required this.position});

  @override
  State<ProductosList> createState() => _ProductosListState();
}

class _ProductosListState extends State<ProductosList> {


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    provider.getAutos();
    provider.getElectronicos();
    provider.getInmuebles();
    Future refresh() async {
      setState((){
        provider.getAutos();
      });
    }
    return provider.isLoading ?  
      const Center(
        child: LinearProgressIndicator(),
      ) : provider.error.isNotEmpty
        ?  Center(
        child: Text('Error al consultar información', style: TextStyles().ubuntu16M),
      ) : listItem(
        context, 
        widget.position == 0 ? provider.autos : widget.position == 1 ? provider.electronicos : provider.inmuebles, 
        refresh);
  }

  Widget listItem(BuildContext context, ProductosResponse productosResponse, Future<void> Function() refresh) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productosResponse.data.length,
        itemBuilder: (context, index) => ProductosItem(producto: productosResponse.data[index])
      ),
    );
  }
}