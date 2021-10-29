import 'package:flutter/material.dart';
import 'package:to_beauty_app/src/shared/colors.dart';

class TextFormFromLogin extends StatelessWidget {
  const TextFormFromLogin({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 19,
            color: shiniessBrown,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}