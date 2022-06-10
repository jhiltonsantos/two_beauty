import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/styles/styles_manager.dart';

class AppBarHomePage extends StatelessWidget {
  const AppBarHomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserGetEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, ${user.firstName}',
              style: TextStyles.titleApp(fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Separamos alguns salões para você cuidar da sua beleza',
                style: TextStyles.subtitleInitApp(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
