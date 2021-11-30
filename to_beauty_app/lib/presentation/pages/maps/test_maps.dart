import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMap extends StatefulWidget {
  const TestMap({Key? key}) : super(key: key);

  @override
  _TestMapState createState() => _TestMapState();
}

class _TestMapState extends State<TestMap> {
  final double _latitude = -5.08921;
  final double _longitude = -42.8016;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestMap"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(_latitude, _longitude),
              zoom: 19.151926040649414,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ),
    );
  }
}
