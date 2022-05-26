import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/home/home_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/progress_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is InitHomeState || state is LoadingHomeState) {
          return const ProgressWidget();
        }
        return const ErrorPage();
      },
    );
  }
}
