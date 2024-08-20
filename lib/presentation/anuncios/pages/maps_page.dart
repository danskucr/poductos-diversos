import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/Text/text_constants.dart';
import '../../../constants/colors/palette.dart';

class MapsPage extends StatefulWidget {
  final double latitude;
  final double longitude;
   MapsPage({super.key, required this.latitude, required this.longitude});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController? mapController;
  late double latitude;
  late double longitude;
  
  final LatLng _center = const LatLng(19.302857, -99.1886819);

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }
  TextConstants textConstants = TextConstants();
  ColorsPalette colorsPalette = ColorsPalette();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(textConstants.mapaAnuncio), backgroundColor: ColorsPalette().whitePD),
      backgroundColor: colorsPalette.whitePD,
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude), // San Francisco coordinates
            zoom: 12,
          ),
          markers: {
            Marker(
              markerId: MarkerId('México'),
              position: LatLng(widget.latitude, widget.longitude)
            )
          },
      ),
    );
  }
}