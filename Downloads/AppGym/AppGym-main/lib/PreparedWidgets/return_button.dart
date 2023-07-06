import 'package:flutter/material.dart';

class ReturnButtonApp extends StatelessWidget implements IconButton {
  const ReturnButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  // TODO: implement alignment
  AlignmentGeometry? get alignment => throw UnimplementedError();

  @override
  // TODO: implement autofocus
  bool get autofocus => throw UnimplementedError();

  @override
  // TODO: implement color
  Color? get color => throw UnimplementedError();

  @override
  // TODO: implement constraints
  BoxConstraints? get constraints => throw UnimplementedError();

  @override
  // TODO: implement disabledColor
  Color? get disabledColor => throw UnimplementedError();

  @override
  // TODO: implement enableFeedback
  bool? get enableFeedback => throw UnimplementedError();

  @override
  // TODO: implement focusColor
  Color? get focusColor => throw UnimplementedError();

  @override
  // TODO: implement focusNode
  FocusNode? get focusNode => throw UnimplementedError();

  @override
  // TODO: implement highlightColor
  Color? get highlightColor => throw UnimplementedError();

  @override
  // TODO: implement hoverColor
  Color? get hoverColor => throw UnimplementedError();

  @override
  // TODO: implement icon
  Widget get icon => throw UnimplementedError();

  @override
  // TODO: implement iconSize
  double? get iconSize => throw UnimplementedError();

  @override
  // TODO: implement isSelected
  bool? get isSelected => throw UnimplementedError();

  @override
  // TODO: implement mouseCursor
  MouseCursor? get mouseCursor => throw UnimplementedError();

  @override
  // TODO: implement onPressed
  VoidCallback? get onPressed => throw UnimplementedError();

  @override
  // TODO: implement padding
  EdgeInsetsGeometry? get padding => throw UnimplementedError();

  @override
  // TODO: implement selectedIcon
  Widget? get selectedIcon => throw UnimplementedError();

  @override
  // TODO: implement splashColor
  Color? get splashColor => throw UnimplementedError();

  @override
  // TODO: implement splashRadius
  double? get splashRadius => throw UnimplementedError();

  @override
  // TODO: implement style
  ButtonStyle? get style => throw UnimplementedError();

  @override
  // TODO: implement tooltip
  String? get tooltip => throw UnimplementedError();

  @override
  // TODO: implement visualDensity
  VisualDensity? get visualDensity => throw UnimplementedError();
}
