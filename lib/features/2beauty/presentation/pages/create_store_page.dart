import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';

class CreateStorePage extends StatelessWidget {
  const CreateStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStoreCubit, CreateStoreState>(
        builder: (context, state) {
      if (state is InitCreateStoreState) {
        return const LoadedCreateStoreWidget();
      }
      return const ErrorPage();
    });
  }
}

class LoadedCreateStoreWidget extends StatelessWidget {
  const LoadedCreateStoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Crie seu estabelecimento aqui.',
        style: TextStyles.labelTitleTile(),
      )),
    );
  }
}
