import 'package:flutter/material.dart';
import 'package:to_beauty_app/presentation/pages/maps/place_viewmodel.dart';
import 'package:to_beauty_app/presentation/resources/assets_manager.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class PlaceListWidget extends StatelessWidget {
  List<PlaceViewModel> places;
  Function(PlaceViewModel) onSelected;

  PlaceListWidget({Key? key, required this.places, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];

        return ListTile(
          onTap: () {
            onSelected(place);
          },
          leading: Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
                height: 100,
                width: 100,
                child: place.photoURL == ImageAssets.logoImage
                    ? Image.asset(
                        ImageAssets.introImage6,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        AppStrings.urlForReferenceImage(place.photoURL),
                        fit: BoxFit.cover,
                      )),
          ),
          title: Text(place.name),
        );
      },
    );
  }
}
