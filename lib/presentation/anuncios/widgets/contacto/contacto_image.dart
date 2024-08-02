import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:productos_diversos/data/API/provider/contacto.dart';
import 'package:provider/provider.dart';

class ContactoImage extends StatefulWidget {
  const ContactoImage({super.key});

  @override
  State<ContactoImage> createState() => _ContactoImageState();
}

class _ContactoImageState extends State<ContactoImage> {
  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ContactoProvider>(context);
  provider.getContacto();
    return provider.isLoading ?  
      const Center(
        child: LinearProgressIndicator(),
      ) : provider.error.isNotEmpty
        ?  Center(
        child: Text('Error al consultar información', style: TextStyles().ubuntu16M),
      ) : Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage: NetworkImage(provider.contacto.imagen),
        ),
        SizedBox(height: 10,),
        Text(provider.contacto.nombre, style: TextStyles().ubuntu16B,)
      ],
    );
  }
}