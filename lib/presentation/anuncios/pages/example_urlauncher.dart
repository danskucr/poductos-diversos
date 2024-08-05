import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ExampleUrlauncher extends StatefulWidget {
  const ExampleUrlauncher({super.key, required this.title});
  final String title;

  @override
  State<ExampleUrlauncher> createState() => _ExampleUrlauncherState();
}

class _ExampleUrlauncherState extends State<ExampleUrlauncher> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

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

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
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
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    onChanged: (String text) => _phone = text,
                    decoration: const InputDecoration(
                        hintText: 'Input the phone number to launch')),
              ),
              ElevatedButton(
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched = _makePhoneCall(_phone);
                        })
                    : null,
                child: _hasCallSupport
                    ? const Text('Make phone call')
                    : const Text('Calling not supported'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(toLaunch.toString()),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch);
                }),
                child: const Text('Launch in browser'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),


     
            ],
          ),
        ],
      ),
    );
  }
}