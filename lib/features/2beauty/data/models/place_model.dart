import 'package:two_beauty/features/2beauty/domain/entities/place_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';

class PlaceModel extends PlaceEntity {
  const PlaceModel(
      {required String name,
      required double latitude,
      required double longitude,
      required String placeId,
      required String photoURL})
      : super(
            name: name,
            latitude: latitude,
            longitude: longitude,
            placeId: placeId,
            photoURL: photoURL);

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    final location = json["geometry"]["location"];
    Iterable photos = json["photos"];
    return PlaceModel(
        name: json["name"],
        latitude: location["lat"],
        longitude: location["lng"],
        placeId: json["place_id"],
        photoURL: photos.isEmpty
            ? ImageAssets.iconStoreDefault
            : photos.first["photo_reference"].toString());
  }
}
