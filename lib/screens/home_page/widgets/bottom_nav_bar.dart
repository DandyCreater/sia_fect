import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/local/auth_services.dart';
import 'package:sia_fect/screens/login_page/login_page.dart';
import 'package:sia_fect/screens/profile_page/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  final AuthServices _authServices = AuthServices();
  final Function(int) onTap;

  BottomNavBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  doLogout(BuildContext context) async {
    await _authServices.logOut().then((value) => Navigator.pushReplacementNamed(context, LoginPage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Platform.isIOS ? 80 : 54,
      child: BottomAppBar(
        elevation: 20,
        color: ColorPallete.primary,
        child: Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: PopupMenuButton(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                onSelected: (value) {
                  switch (value) {
                    case 'profile':
                      Navigator.pushNamed(context, ProfilePage.routeName);
                      break;
                    case 'exit':
                      doLogout(context);
                      break;
                    default:
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'profile',
                    child: Text(Strings.profile),
                  ),
                  PopupMenuItem(
                    value: 'exit',
                    child: Text(Strings.exit),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () => onTap(1),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
