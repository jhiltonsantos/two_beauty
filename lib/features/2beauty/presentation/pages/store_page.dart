import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_button.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/button_intro_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/card_info.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/text_label_profile_widget.dart';

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
        return StoreLoadedWidget(
          store: state.store,
          idStore: widget.id,
        );
      }
      return const ErrorPage();
    }));
  }
}

class StoreLoadedWidget extends StatelessWidget {
  final StoreGetEntity store;
  final String idStore;

  const StoreLoadedWidget({
    Key? key,
    required this.store,
    required this.idStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(bottomNavyRoute);
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
                  Navigator.of(context).pushReplacementNamed(bottomNavyRoute),
              leadingIcon: Icons.arrow_back,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CardInfo(store: store),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  TextLabelProfileWidget(text: 'CEP', data: store.cep),
                  TextLabelProfileWidget(text: 'Bairro', data: store.district),
                  TextLabelProfileWidget(text: 'Rua', data: store.street),
                  TextLabelProfileWidget(text: 'Número', data: store.number),
                ],
              ),
            ),
            ButtonIntroApp(
                onPressed: () => Navigator.of(context)
                    .pushNamed(appointmentRoute, arguments: idStore),
                styleButton: ButtonStyles.buttonPrimary(),
                styleText: TextStyles.buttonApp(ColorManager.white_100),
                text: 'Marcar agendamento'),
          ],
        ),
      ),
    );
  }
}
