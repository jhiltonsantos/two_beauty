import 'package:to_beauty_app/domain/entities/place_model.dart';

class PlaceViewModel {
  late PlaceModel _placeModel;

  PlaceViewModel(PlaceModel place) {
    _placeModel = place;
  }

  String get placeId {
    return _placeModel.placeId;
  }

  String get photoURL {
    return _placeModel.photoURL;
  }

  String get name {
    return _placeModel.name;
  }

  double get latitude {
    return _placeModel.latitude;
  }

  double get longitude {
    return _placeModel.longitude;
  }
}
