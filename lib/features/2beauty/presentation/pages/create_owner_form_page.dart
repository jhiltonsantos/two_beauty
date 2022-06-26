// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_owner/create_owner_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/create_owner/create_owner_state.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_card_widget.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/error_page.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/widgets/owner_form_widget.dart';

class CreateOwnerFormPage extends StatelessWidget {
  const CreateOwnerFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOwnerCubit, CreateOwnerState>(
        builder: (context, state) {
      if (state is LoadedCreateOwnerState) {
        return const OwnerFormWidget();
      }
      if (state is ErrorCreateOwnerState) {
        return ErrorCardWidget(
          message: state.message,
          function: () => BlocProvider.of<CreateOwnerCubit>(context)
              .emit(const LoadedCreateOwnerState()),
        );
      }
      return const ErrorPage();
    });
  }
}
