import 'package:flutter/material.dart';
import 'package:mentor_app/views/shared/shared_values.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, this.onPressed, this.minWidth, this.height, this.child, this.withBorder})
      : super(key: key);
  final VoidCallback? onPressed;
  final double? minWidth;
  final double? height;
  final Widget? child;
  final bool? withBorder;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height ?? 55,
      padding: EdgeInsets.zero,
      minWidth: minWidth,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SharedValues.borderRadius),
          borderSide: withBorder==false?BorderSide.none:BorderSide(color: Theme.of(context).primaryColor,width: 1.5)),
      child: child,
    );
  }
}
