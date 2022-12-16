import 'package:flutter/material.dart';
import 'package:mentor_app/views/shared/shared_components.dart';
import 'package:mentor_app/views/shared/shared_values.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
        required this.controller,
        this.hintText,
        this.validator,
        this.keyboardType,
        this.onChanged,
        this.focusNode,
        this.readOnly,
        this.textAlign,
        this.onTap,
        this.obscureText,
        this.textDirection,
        this.prefixIcon,
        this.suffixIcon,
        this.textInputAction,
        this.maxLines})
      : super(key: key);
  final TextEditingController controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textDirection: textDirection,
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      onTap: onTap,
      focusNode: focusNode,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: InputDecoration(
        hintText: hintText,
          contentPadding: Theme.of(context).inputDecorationTheme.contentPadding
      ),
    );
  }
}