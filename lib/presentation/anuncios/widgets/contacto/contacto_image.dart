import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/style/text_style.dart';

class ContactoImage extends StatefulWidget {
  const ContactoImage({super.key});

  @override
  State<ContactoImage> createState() => _ContactoImageState();
}

class _ContactoImageState extends State<ContactoImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48, // Image radius
          backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/8/88/2019_Mazda3_SE-L_2.0_Front.jpg'),
        ),
        SizedBox(height: 10,),
        Text('NOMBREE', style: TextStyles().ubuntu16B,)
      ],
    );
  }
}