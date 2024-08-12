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

  final controllerList = ScrollController();
  
  @override
  void initState() {
    super.initState();
    controllerList.addListener(_onScroll);
    context.read<ProductosProvider>().getAutos();
    context.read<ProductosProvider>().getInmuebles();
    context.read<ProductosProvider>().getElectronicos();
  }
  void _onScroll() async {
    if (controllerList.position.pixels >=
        controllerList.position.maxScrollExtent) {
      await Future.delayed(Duration(seconds: 3));
      if (widget.position == 0) {
        context.read<ProductosProvider>().getAutos();
      } else if (widget.position == 1) {
        context.read<ProductosProvider>().getInmuebles();
      } else {
        context.read<ProductosProvider>().getElectronicos();

      }
      
    }
  }

  @override
  void dispose() {
    controllerList.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Future refresh() async {
      setState((){
        // provider.getAutos();
      });
    }

    return Consumer<ProductosProvider>(
      builder: (context, provider, child) {
        return provider.isLoading ?  
          const Center(
            child: LinearProgressIndicator(),
          ) : provider.error.isNotEmpty
            ?  Center(
            child: Text('Error al consultar información', style: TextStyles().ubuntu16M),
          ) : listItem(
            context, 
            widget.position == 0 ? provider.productoAutos : widget.position == 1 ? provider.productoInmuebles : provider.productoElectronicos, 
            refresh);
      }
    );
  }

  Widget listItem(BuildContext context, List<Producto> productos, Future<void> Function() refresh) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        controller: controllerList,
        padding: const EdgeInsets.all(10),
        itemCount: productos.length + 1,
        itemBuilder: (context, index) {
          if (index < productos.length) {
            final item = productos[index];
            
            return ProductosItem(producto: item);
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator())
            );
          }
        }
      ),
    );
  }
}
