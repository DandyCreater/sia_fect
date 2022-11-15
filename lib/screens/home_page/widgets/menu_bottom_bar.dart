import 'package:flutter/material.dart';

class MenuBottomBar extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String? label;
  final Function()? onPress;

  const MenuBottomBar({
    Key? key,
    required this.icon,
    this.iconColor,
    this.label,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: IntrinsicHeight(
          child: SizedBox(
            width: 60,
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: iconColor ?? Colors.white,
                ),
                label != null
                    ? Text(
                        label!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
