import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class AppBarCreateStoreWidget extends StatelessWidget {
  const AppBarCreateStoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vamos criar seu negócio',
            style: TextStyles.titleApp(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Precisaremos de alguns dados seus. Não vai durar dois minutos.',
              style: TextStyles.subtitleInitApp(),
            ),
          )
        ],
      ),
    );
  }
}