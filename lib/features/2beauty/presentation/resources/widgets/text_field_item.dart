import 'package:flutter/material.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/colors_manager.dart';

class TextFieldItem extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? autofocus;

  const TextFieldItem({
    Key? key,
    required this.controller,
    this.textInputType,
    this.hintText,
    this.autofocus,
  }) : super(key: key);

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextField(
          keyboardType: widget.textInputType ?? TextInputType.text,
          autofocus: widget.autofocus ?? false,
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
          ),
        ));
  }
}
