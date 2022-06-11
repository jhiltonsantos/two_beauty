import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String placeId;
  final String photoURL;

  const PlaceEntity(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.placeId,
      required this.photoURL});

  @override
  List<Object?> get props => [name, latitude, longitude, placeId, photoURL];
}
