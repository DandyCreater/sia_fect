import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double size;
  final Widget content;
  final EdgeInsetsGeometry? padding;

  const CustomAppBar({
    Key? key,
    required this.size,
    required this.content,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(left: 24, right: 24, top: Platform.isIOS ? 40 : 25),
      decoration: const BoxDecoration(
        color: ColorPallete.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: content,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? size : size + 10);
}
