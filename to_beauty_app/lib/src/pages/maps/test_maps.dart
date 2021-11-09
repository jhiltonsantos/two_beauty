import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMap extends StatefulWidget {
  const TestMap({Key? key}) : super(key: key);

  @override
  _TestMapState createState() => _TestMapState();
}

class _TestMapState extends State<TestMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Maps Marker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Hilton'),
          ],
        ),
      ),
    );
  }
}
