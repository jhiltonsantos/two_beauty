import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/subtitle_tile_card_widget.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.store,
  }) : super(key: key);

  final StoreGetEntity store;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 72.0,
          width: 72.0,
          child: SvgPicture.asset(
            ImageAssets.iconStoreDefault,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 12.0),
          child: Text(
            store.name,
            style: TextStyles.textTitleStoreDetails(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubtitleTileCard(
                text: "${store.openHour} - ${store.closeHour}",
                image: ImageAssets.iconAlarmClock,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubtitleTileCard(
                  text: store.phone, image: ImageAssets.iconPhone)
            ],
          ),
        )
      ],
    );
  }
}