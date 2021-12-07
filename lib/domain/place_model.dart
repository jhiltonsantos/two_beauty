import 'package:to_beauty_app/presentation/resources/assets_manager.dart';

class PlaceModel {
  final String name;
  final double latitude;
  final double longitude;
  final String placeId;
  final String photoURL;

  PlaceModel(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.placeId,
      required this.photoURL});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    final location = json["geometry"]["location"];

    Iterable photos = json["photos"];

    return PlaceModel(
        name: json["name"],
        latitude: location["lat"],
        longitude: location["lng"],
        placeId: json["place_id"],
        photoURL: photos == null // Não alterar para isEmpty
            ? ImageAssets.logoImage
            : photos.first["photo_reference"].toString());
  }
}
