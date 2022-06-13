import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/subtitle_tile_card_widget.dart';

class StorePage extends StatefulWidget {
  final String id;

  const StorePage({Key? key, required this.id}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  void initState() {
    super.initState();
    final storeData = context.read<StoreCubit>();
    storeData.getStoreData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(builder: ((context, state) {
      if (state is InitStoreState || state is LoadingStoreState) {
        return const ProgressWidget();
      }
      if (state is LoadedStoreState) {
        return StoreLoadedWidget(store: state.store);
      }
      return const ErrorPage();
    }));
  }
}

class StoreLoadedWidget extends StatelessWidget {
  final StoreGetEntity store;
  const StoreLoadedWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(homeRoute);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.white_200,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBarWidget(
              title: 'Detalhes do\nestabelecimento',
              fontSizeTitle: 24.0,
              leadingOnTap: () =>
                  Navigator.of(context).pushReplacementNamed(homeRoute),
              leadingIcon: Icons.arrow_back,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
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
            ),
            Center(
                child: Column(
              children: [
                Text(
                  store.cnpj,
                  style: TextStyles.subtitleInitApp(),
                ),
                Text(
                  store.name,
                  style: TextStyles.subtitleInitApp(),
                ),
              ],
            )),
            const SizedBox(height: 50.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(homeRoute);
                },
                child: const Text('Voltar'))
          ],
        ),
      ),
    );
  }
}
