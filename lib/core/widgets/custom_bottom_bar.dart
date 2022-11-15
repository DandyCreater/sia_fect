import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 100,
      child: Row(
        children: [
          const Expanded(child: Text('')),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Container(
              width: 120,
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              decoration: const BoxDecoration(
                color: ColorPallete.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: const Text(
                'HOME',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Expanded(child: Text('')),
        ],
      ),
    );
  }
}
