import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:two_beauty/data/datasources/place_service.dart';
import 'package:two_beauty/presentation/pages/maps/place_viewmodel.dart';

class PlaceListViewModel extends ChangeNotifier {
  var places = <PlaceViewModel>[];
  var mapType = MapType.normal;

  void toggleMapType() {
    mapType = mapType == MapType.normal ? MapType.hybrid : MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final data = await WebService()
        .fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
    places = data.map((e) => PlaceViewModel(e)).toList();
    notifyListeners(); // Notifica que o conteúdo foi atualizado
  }
}
