// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_store/create_store_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_card_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/store_address_widget.dart';

class CreateStoreAddressPage extends StatefulWidget {
  final List listArgs;

  const CreateStoreAddressPage({
    Key? key,
    required this.listArgs,
  }) : super(key: key);

  @override
  State<CreateStoreAddressPage> createState() => _CreateStoreAddressPageState();
}

class _CreateStoreAddressPageState extends State<CreateStoreAddressPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStoreCubit, CreateStoreState>(
        builder: (context, state) {
      if (state is LoadedCreateStoreState) {
        return StoreAddressWidget(
            name: widget.listArgs[0],
            cnpj: widget.listArgs[1],
            phone: widget.listArgs[2],
            openHour: widget.listArgs[3],
            closeHour: widget.listArgs[4]);
      }
      if (state is ErrorCreateStoreState) {
        return ErrorCardWidget(
          message: state.message,
          function: () => BlocProvider.of<CreateStoreCubit>(context)
              .emit(const LoadedCreateStoreState()),
        );
      }
      return const ErrorPage();
    });
  }
}
