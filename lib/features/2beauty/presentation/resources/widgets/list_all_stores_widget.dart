import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/subtitle_tile_card_widget.dart';

class ListAllStores extends StatelessWidget {
  const ListAllStores({
    Key? key,
    required this.stores,
  }) : super(key: key);

  final List<StoreGetEntity> stores;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 500.0,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              StoreGetEntity store = stores[index];
              return Column(
                children: [
                  InkWell(
                    highlightColor: ColorManager.purple_100,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    onTap: () => Navigator.of(context).pushReplacementNamed(
                        detailStore,
                        arguments: store.id.toString()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 72.0,
                                width: 72.0,
                                child: SvgPicture.asset(
                                  ImageAssets.iconStoreDefault,
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    store.name,
                                    style: TextStyles.labelTitleTile(),
                                  ),
                                  const SizedBox(height: 12.0),
                                  SubtitleTileCard(
                                    text: "${store.district}, ${store.number}",
                                    image: ImageAssets.iconLocation,
                                  ),
                                  const SizedBox(height: 5.0),
                                  SubtitleTileCard(
                                    text:
                                        "${store.openHour} - ${store.closeHour}",
                                    image: ImageAssets.iconAlarmClock,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Divider(
                      height: 1,
                      thickness: 2,
                      color: ColorManager.white_300,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
