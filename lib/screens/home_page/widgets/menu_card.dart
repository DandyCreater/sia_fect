import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sia_fect/core/const/color_pallete.dart';

class MenuCard extends StatelessWidget {
  final String label;
  final String icon;
  final Function()? onPress;

  const MenuCard({
    Key? key,
    required this.label,
    required this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 2,
          color: ColorPallete.lightBlue,
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            onTap: onPress,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 95,
              width: 95,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                icon,
                semanticsLabel: label,
                height: 66,
                width: 66,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 95,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
