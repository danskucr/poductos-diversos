import 'package:flutter/material.dart';

class ContactoForm extends StatelessWidget {
  const ContactoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre'),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10)
                ),
              ),
            ),
            
            Text('Correo Contacto'),
            TextFormField(),
            Text('Texto Correo'),
            TextFormField(),
            ElevatedButton(
              onPressed: (){},
              child: Text('Contactar al vendedor')
            )
          ],
        ),
      ),
    );
  }
}