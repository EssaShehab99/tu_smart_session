import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tu_smart_session/views/shared/shared_values.dart';

class TextFieldWidget extends StatefulWidget {
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
      this.maxLines,
      this.suggestions})
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
  final List<String>? suggestions;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>
    with WidgetsBindingObserver {
  OverlayEntry? _overlayEntry;
  late LayerLink _layerLink;
  FocusNode? _focusNode;
  List<String> searchItem = [];
  StreamController<List<String>>? _streamController;

  @override
  void initState() {
    if (widget.suggestions?.isNotEmpty == true) {
      searchItem = widget.suggestions!;
      _streamController = StreamController.broadcast();
      WidgetsBinding.instance.addObserver(this);
    }
    _layerLink = LayerLink();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode?.addListener(() {
      if (!_focusNode!.hasFocus && _overlayEntry?.mounted == true) {
        _overlayEntry?.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry(ctx) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              child: Container(
                height: 200,
                margin: const EdgeInsetsDirectional.only(
                    end: SharedValues.padding * 2),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius:
                        BorderRadius.circular(SharedValues.borderRadius),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ]),
                child: StreamBuilder<List<String>>(
                  stream: _streamController?.stream,
                  initialData: searchItem,
                  builder: (context, snapshot) => ListView(
                    padding: const EdgeInsets.all(SharedValues.padding),
                    children: [
                      for (String item in snapshot.data ?? [])
                        InkWell(
                          onTap: () {
                            _overlayEntry?.remove();
                            widget.controller.text = item;
                          },
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: SharedValues.padding),
                                Text(
                                  item,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                const SizedBox(height: SharedValues.padding),
                                const Divider(
                                  thickness: 2,
                                ),
                              ]),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode?.dispose();
    _streamController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly ?? false,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: TextFormField(
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onChanged: (value) {
            if (widget.suggestions?.isNotEmpty == true) {
              _streamController?.add(widget.suggestions
                      ?.where((element) =>
                          element.toUpperCase().contains(value.toUpperCase()))
                      .toList() ??
                  []);
            } else if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          maxLines: widget.maxLines ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textDirection: widget.textDirection,
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyboardType,
          onTap: () {
            debugPrint(
                "===============TextFieldWidget->build->widget.suggestions: ${widget.suggestions.toString()}=================");
            if (widget.suggestions?.isNotEmpty == true) {
              _overlayEntry = _createOverlayEntry(context);
              Overlay.of(context)?.insert(_overlayEntry!);
            } else if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          focusNode: _focusNode,
          textAlign: widget.textAlign ?? TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              contentPadding:
                  Theme.of(context).inputDecorationTheme.contentPadding),
        ),
      ),
    );
  }
}
