// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_home_page_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/close_app_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_home_page_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/list_all_stores_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';
import 'package:two_beauty/objectbox.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final userData = context.read<HomeCubit>();
    userData.getHomeData(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is InitHomeState || state is LoadingHomeState) {
          return const ProgressWidget();
        }
        if (state is LoadedHomeState) {
          return HomeWidget(
            user: state.user,
            stores: state.stores,
          );
        }
        if (state is CloseAppHomeState) {
          return const CloseAppWidget();
        }
        return const ErrorPage();
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  final UserGetEntity user;
  final List<StoreGetEntity> stores;

  HomeWidget({Key? key, required this.user, required this.stores})
      : super(key: key);

  late Store storeData;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(closeAppRoute);
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(180),
            child: AppBarHomePage(user: user)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: LabelHomePage(
                text: 'Estabelecimentos\nencontrados',
                countStores: stores.length,
              ),
            ),
            ListAllStores(stores: stores),
          ],
        ),
      ),
    );
  }
}
