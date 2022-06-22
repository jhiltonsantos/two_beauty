import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/assets_manager.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class TextFieldItemPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? textInputType;
  final bool iconSufix;

  const TextFieldItemPassword(
      {Key? key,
      required this.controller,
      this.obscureText,
      this.textInputType,
      this.hintText,
      required this.iconSufix})
      : super(key: key);

  @override
  State<TextFieldItemPassword> createState() => _TextFieldItemPasswordState();
}

class _TextFieldItemPasswordState extends State<TextFieldItemPassword> {
  late bool passwordObscure;

  @override
  void initState() {
    super.initState();
    passwordObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: widget.textInputType ?? TextInputType.text,
        obscureText: passwordObscure,
        obscuringCharacter: "*",
        expands: false,
        controller: widget.controller,
        style: const TextStyle(fontSize: 16.0, fontFamily: "Epilogue_400"),
        decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.white_100,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: ColorManager.white_100, width: 0.0),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide:
                    BorderSide(color: ColorManager.purple_200, width: 2.0)),
            hintText: widget.hintText ?? "",
            suffixIcon: widget.iconSufix
                ? InkWell(
                    onTap: () =>
                        setState(() => passwordObscure = !passwordObscure),
                    child: SvgPicture.asset(
                      passwordObscure
                          ? ImageAssets.previewClosePassword
                          : ImageAssets.previewOpenPassword,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : null),
      ),
    );
  }
}
