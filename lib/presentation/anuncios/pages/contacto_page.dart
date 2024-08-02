import 'package:flutter/material.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/contacto/contacto_form.dart';
import 'package:productos_diversos/presentation/anuncios/widgets/contacto/contacto_link.dart';

import '../../../constants/Text/text_constants.dart';
import '../../../constants/colors/palette.dart';

class ContactoPage extends StatefulWidget {
  const ContactoPage({super.key});

  @override
  State<ContactoPage> createState() => _ContactoPageState();
}

class _ContactoPageState extends State<ContactoPage> {

  TextConstants textConstants = TextConstants();
  ColorsPalette colorsPalette = ColorsPalette();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: AppBar(title: Text(textConstants.detalleAnuncio),),
      backgroundColor: colorsPalette.whitePD,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ContactoLink(),
                ContactoForm()
              ],
            ),
          ],
        ),
      )
    );
  }
}