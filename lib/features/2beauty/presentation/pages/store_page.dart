import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/core/routes/routes.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/store/store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
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
        return Scaffold(
          backgroundColor: ColorManager.white_200,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(state.store.name)),
              const SizedBox(height: 50.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(homeRoute);
                  },
                  child: const Text('Voltar'))
            ],
          ),
        );
      }
      return const ErrorPage();
    }));
  }
}
