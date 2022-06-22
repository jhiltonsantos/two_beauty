import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/presentation/bloc/bottom_navy/bottom_navy_cubit.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

@injectable
class LogoutModal {
  call(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CircleAvatar(
                      backgroundColor: ColorManager.white_300,
                      child: Icon(Icons.arrow_back_outlined),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Continuar',
                      style: TextStyles.subtitleInitApp(),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<BottomNavyCubit>(context).logout();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CircleAvatar(
                      backgroundColor: ColorManager.red_200,
                      child: Icon(Icons.logout),
                    ),
                    const SizedBox(height: 20.0),
                    Text('Sair', style: TextStyles.subtitleInitApp())
                  ],
                ),
              ),
            ],
          );
        });
  }
}