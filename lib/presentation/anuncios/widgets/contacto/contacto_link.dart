import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/style/text_style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/API/provider/contacto.dart';

class ContactoLink extends StatefulWidget {
  const ContactoLink({super.key});

  @override
  State<ContactoLink> createState() => _ContactoLinkState();
}

class _ContactoLinkState extends State<ContactoLink> {
  
  bool _hasCallSupport = false;
  String _phone = '';
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactoProvider>(context);
    provider.getContacto();
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.phone),
            SizedBox(height: 10),
            Text('Call', style: TextStyles().ubuntu14B,)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: _hasCallSupport
            ? () => setState(() {
                  _launched = _makePhoneCall(provider.contacto.telefono);
                })
            : null,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            height: 80,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Mobile\n+${provider.contacto.telefono}', style: TextStyles().ubuntu16M,),
            ),
          )
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(Icons.mail),
            SizedBox(height: 10),
            Text('Mail', style: TextStyles().ubuntu14B,)          ],
        ),
      ],
    );
  }
}