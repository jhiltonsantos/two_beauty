import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/app_bar_home_page_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/label_home_page_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';

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
        return const ErrorPage();
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  final UserGetEntity user;
  final List<StoreGetEntity> stores;

  const HomeWidget({Key? key, required this.user, required this.stores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: AppBarHomePage(user: user)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: const [
            LabelHomePage(
              fontSize: 24,
              text: 'Estabelecimentos\nencontrados',
            ),
            Center(child: Text('Continua'))
          ]),
        ),
      ),
    );
  }
}
