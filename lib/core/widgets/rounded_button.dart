import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';

class RoundedButton extends StatelessWidget {
  final void Function() onClicked;
  final String label;
  final double height;
  final double width;
  final double borderRadius;
  final Color backgroundColor;

  const RoundedButton({
    Key? key,
    required this.onClicked,
    required this.label,
    this.height = 45,
    this.width = 100,
    this.borderRadius = 5.0,
    this.backgroundColor = ColorPallete.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox(
            height: height,
            width: width,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.blue),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              onPressed: onClicked,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height / 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
