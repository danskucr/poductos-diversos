import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'package:productos_diversos/constants/style/text_style.dart';

class ContactoForm extends StatefulWidget {
  const ContactoForm({super.key});

  @override
  State<ContactoForm> createState() => _ContactoFormState();
}

class _ContactoFormState extends State<ContactoForm> {
  ColorsPalette colorsPalette = ColorsPalette();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Nombre', style: TextStyles().ubuntu16B,),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.amber,
                focusColor: Colors.amber,
                prefixIconColor: Colors.amber,
                hoverColor: Colors.amber,
                suffixIconColor: Colors.amber,
                border: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Correo Contacto', style: TextStyles().ubuntu16B),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Texto Correo', style: TextStyles().ubuntu16B),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorsPalette.blueDarkPD,
                  ),
                  onPressed: (){},
                  child: Text('Contactar al vendedor',
                  style: TextStyles().ubuntu16But
                  
                  )
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}