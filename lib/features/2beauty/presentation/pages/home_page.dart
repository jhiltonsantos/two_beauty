import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
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
    userData.getUserData(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is InitHomeState || state is LoadingHomeState) {
          return const ProgressWidget();
        }
        if (state is LoadedHomeState) {
          final user = state.user;
          return Scaffold(
            body: Column(children: [Center(child: Text('$user'),)]),
          );
        }
        return const ErrorPage();
      },
    );
  }
}
