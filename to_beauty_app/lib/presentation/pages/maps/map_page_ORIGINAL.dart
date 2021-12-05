/* import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:map_launcher/map_launcher.dart' as prefix0;
import 'package:to_beauty_app/presentation/pages/maps/place_list_viewmodel.dart';
import 'package:to_beauty_app/presentation/pages/maps/place_viewmodel.dart';
import 'package:to_beauty_app/presentation/resources/colors_manager.dart';
import 'package:to_beauty_app/presentation/resources/routes_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';
import 'package:to_beauty_app/presentation/resources/widgets/map/place_list_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late Position _currentPosition;

  final double _latitude = -5.08921;
  final double _longitude = -42.8016;

  @override
  void initState() {
    super.initState();
  }

  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places) {
    return places.map((place) {
      return Marker(
        markerId: MarkerId(place.placeId),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: place.name),
        position: LatLng(place.latitude, place.longitude),
      );
    }).toSet();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 14,
        ),
      ),
    );
  }

  // Vai para o mapa ao clicar no estabelecimento
  Future<void> _openMapsFor(PlaceViewModel view) async {
    if (await prefix0.MapLauncher.isMapAvailable(prefix0.MapType.google) !=
        null) {
      await prefix0.MapLauncher.showMarker(
          mapType: prefix0.MapType.google,
          coords: prefix0.Coords(view.latitude, view.longitude),
          title: view.name,
          description: view.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlaceListViewModel>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: viewModel.mapType,
              markers: _getPlaceMarkers(viewModel.places),
              initialCameraPosition: CameraPosition(
                target: LatLng(_latitude, _longitude),
                zoom: 14,
              ),
              onMapCreated: _onMapCreated,
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(1, 55),
                primary: ColorManager.whiteColor,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 5.0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.homeRoute);
              },
              child: const Text("Voltar"),
            ),
          )),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 60.0, right: 65.0),
            child: TextField(
              onSubmitted: (value) {
                viewModel.fetchPlacesByKeywordAndPosition(value,
                    _currentPosition.latitude, _currentPosition.longitude);
              },
              decoration: const InputDecoration(
                labelText: "Procure aqui",
                labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: ColorManager.blueGreyColor,
                    fontWeight: FontWeight.w800),
                fillColor: ColorManager.whiteColor,
                filled: true,
              ),
            ),
          )),
          Visibility(
            visible: viewModel.places.isNotEmpty ? true : false,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    child: const Text(
                      AppStrings.listMap,
                      style: TextStyle(color: ColorManager.blueGreyColor),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => PlaceListWidget(
                          places: viewModel.places,
                          onSelected: _openMapsFor,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(140, 50),
                      primary: ColorManager.whiteColor,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 5.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120.0,
            right: 10.0,
            child: FloatingActionButton(
              onPressed: () {
                viewModel.toggleMapType();
              },
              child: const Icon(Icons.map),
            ),
          ),
        ],
      ),
    );
  }
}
 */