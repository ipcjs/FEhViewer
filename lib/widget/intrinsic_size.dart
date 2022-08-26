import 'package:flutter/cupertino.dart';

/// Created by ipcjs on 2022/8/26.
class IntrinsicSize extends StatelessWidget {
  const IntrinsicSize({
    Key? key,
    this.height = true,
    this.width = true,
    required this.child,
  }) : super(key: key);
  final bool height;
  final bool width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget current = child;
    if (width) {
      current = IntrinsicWidth(child: current);
    }
    if (height) {
      current = IntrinsicHeight(child: current);
    }
    return current;
  }
}
