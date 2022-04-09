import 'package:flutter/material.dart';
import 'package:two_beauty/presentation/resources/widgets/appBar/icon_back_appbar_widget.dart';
import 'package:two_beauty/presentation/resources/widgets/appBar/text_appBar_widget.dart';

class AppBarPersonalize extends StatelessWidget {
  const AppBarPersonalize({
    Key? key,
    required this.text,
    required this.route,
  }) : super(key: key);

  final String text;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 30, 0, 0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
            },
            child: const IconBackAppBar(
              icon: Icons.arrow_back,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
            child: TextAppBar(text: text))
      ],
    );
  }
}
