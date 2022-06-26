import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class AppBarCreateStoreWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppBarCreateStoreWidget({
    Key? key, required this.title, required this.subtitle,
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
            title,
            style: TextStyles.titleApp(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              subtitle,
              style: TextStyles.subtitleInitApp(),
            ),
          )
        ],
      ),
    );
  }
}