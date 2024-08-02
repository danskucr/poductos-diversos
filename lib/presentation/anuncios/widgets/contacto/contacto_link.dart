import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    // Check for phone call support.
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.phone),
            Text('Call')
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: _hasCallSupport
            ? () => setState(() {
                  _launched = _makePhoneCall(_phone);
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mobile'),
                  Text('+55 13212321')
                ],
              ),
            ),
          )
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(Icons.mail),
            Text('Mail')
          ],
        ),
      ],
    );
  }
}