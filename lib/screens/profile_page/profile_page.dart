import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/local/auth_services.dart';
import 'package:sia_fect/screens/edit_profile_page/edit_profile_page.dart';
import 'package:sia_fect/screens/profile_page/profile_card.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthServices _authServices = AuthServices();
  Map<String, dynamic>? user;

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  void setInitialData() async {
    final userString = await _authServices.getUserData();
    setState(() {
      user = jsonDecode(userString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.profile,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: ColorPallete.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context,
                EditProfilePage.routeName,
                arguments: user,
              );

              if (result == true) {
                setInitialData();
              }
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ColorPallete.primary,
                // borderRadius: BorderRadius.only(
                //   bottomRight: Radius.circular(80),
                //   bottomLeft: Radius.circular(80),
                // ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 44, left: 24, right: 24, bottom: 24),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 50, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        user?['name'] ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        Strings.academicInformation,
                        style: TextStyle(
                          color: ColorPallete.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ProfileCard(
                          title: Strings.registrationNumber,
                          value: user?['registration_number'] ?? ''),
                      ProfileCard(
                          title: Strings.faculty,
                          value: user?['faculty'] ?? ''),
                      ProfileCard(
                          title: Strings.major, value: user?['major'] ?? ''),
                      user?['user_type'] == 'student'
                          ? ProfileCard(
                              title: Strings.Semestre,
                              value: user?['Semestre'] ?? '-')
                          : const SizedBox.shrink(),
                      const SizedBox(height: 16),
                      const Text(
                        Strings.personalInformation,
                        style: TextStyle(
                          color: ColorPallete.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ProfileCard(
                          title: Strings.name, value: user?['name'] ?? ''),
                      ProfileCard(
                          title: Strings.placeOfBirth,
                          value: user?['place_of_birth'] ?? ''),
                      ProfileCard(
                          title: Strings.dateOfBirth,
                          value: user?['date_of_birth'] ?? ''),
                      ProfileCard(
                          title: Strings.phone, value: user?['phone'] ?? ''),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    user?['avatar_url'] ?? Constants.placeholderAvatarUrl),
                radius: 42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
