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
                  TextLabelProfile(text: 'CEP', data: store.cep),
                  TextLabelProfile(text: 'Bairro', data: store.district),
                  TextLabelProfile(text: 'Rua', data: store.street),
                  TextLabelProfile(text: 'Número', data: store.number),
                ],
              ),
            ),
            ButtonIntroApp(
                styleButton: ButtonStyles.buttonPrimary(),
                styleText: TextStyles.buttonApp(ColorManager.white_100),
                text: 'Marcar agendamento'),
          ],
        ),
      ),
    );
  }
}

class TextLabelProfile extends StatelessWidget {
  final String text;
  final String data;

  const TextLabelProfile({Key? key, required this.text, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelFormItem(title: text, size: 14, color: ColorManager.grey_500),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: LabelForm(
                  title: data, color: ColorManager.grey_300, size: 14.0),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(
            height: 2,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class LabelForm extends StatelessWidget {
  final String title;
  final Color color;
  final double? size;

  const LabelForm(
      {Key? key, required this.title, required this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 24.0,
          color: color,
        ),
      ),
    );
  }
}

class LabelFormItem extends StatelessWidget {
  final String title;
  final double? size;
  final Color? color;

  const LabelFormItem({Key? key, required this.title, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Epilogue_400',
          fontWeight: FontWeight.w500,
          color: color ?? Colors.black,
          fontSize: size ?? 24.0,
        ),
      ),
    );
  }
}
