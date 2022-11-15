import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/services/validator_service.dart';
import 'package:sia_fect/core/widgets/rounded_button.dart';
import 'package:sia_fect/data/local/auth_services.dart';

class EditProfilePage extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController birthPlaceTextEditingController =
      TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  String selectedDate = '';

  final AuthServices _authServices = AuthServices();
  Map<String, dynamic>? user;
  bool isUpdating = false;

  bool _isNeedUpdate = false;

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  void setInitialData() async {
    final userString = await _authServices.getUserData();
    setState(() {
      user = jsonDecode(userString);
      phoneTextEditingController.text = user?['phone'] ?? '';
      birthPlaceTextEditingController.text = user?['place_of_birth'] ?? '';
      selectedDate = user?['date_of_birth'];
    });
  }

  actionUpdateProfile() {
    setState(() {
      isUpdating = true;
    });

    if (user?['user_type'] == 'student') {
      final student = {
        'name': user?['name'],
        'short_name': user?['short_name'],
        'registration_number': user?['registration_number'],
        'avatar_url': user?['avatar_url'],
        'faculty': user?['faculty'],
        'major': user?['major'],
        'Semestre': user?['Semestre'],
        'place_of_birth': birthPlaceTextEditingController.text,
        'date_of_birth': selectedDate,
        'phone': phoneTextEditingController.text,
        'password': user?['password'],
        'user_type': user?['user_type'],
        'Media': user?['Media'],
        'ip': user?['ip'],
        'lecturer': user?['lecturer'],
        'score': user?['score'],
      };

      _authServices.saveUserData(jsonEncode(student));
    } else {
      final lecturer = {
        'name': user?['name'],
        'short_name': user?['short_name'],
        'registration_number': user?['registration_number'],
        'avatar_url': user?['avatar_url'],
        'faculty': user?['faculty'],
        'major': user?['major'],
        'place_of_birth': birthPlaceTextEditingController.text,
        'date_of_birth': selectedDate,
        'phone': phoneTextEditingController.text,
        'password': user?['password'],
        'user_type': user?['user_type'],
      };
      _authServices.saveUserData(jsonEncode(lecturer));
    }

    Timer(const Duration(seconds: 1), () {
      setState(() {
        isUpdating = false;
        _isNeedUpdate = true;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            Strings.updateSuccess,
            style: TextStyle(color: Colors.white),
          ),
          duration: const Duration(milliseconds: 1000),
          backgroundColor: Colors.blue.shade400,
        ),
      );
    });
  }

  Future<bool> _willPopCallback() async {
    Navigator.pop(context, _isNeedUpdate);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.editProfile,
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
              Navigator.pop(context, _isNeedUpdate);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: ColorPallete.primary,
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
                        InkWell(
                          onTap: () async {
                            var newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.parse(selectedDate),
                              firstDate:
                                  DateTime(DateTime.now().year - 80 + 1, 1, 1),
                              lastDate: DateTime.now(),
                            );
                            if (newDate != null) {
                              String convertedDate =
                                  "${newDate.year.toString()}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";
                              setState(() {
                                selectedDate = convertedDate;
                              });
                            }
                          },
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  selectedDate,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: phoneTextEditingController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: Strings.phone,
                            counter: SizedBox.shrink(),
                            contentPadding: EdgeInsets.all(16.0),
                            prefixIcon: Icon(Icons.phone),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return errorBlankInput(Strings.phone);
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: birthPlaceTextEditingController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: Strings.placeOfBirth,
                            counter: SizedBox.shrink(),
                            contentPadding: EdgeInsets.all(16.0),
                            prefixIcon: Icon(Icons.place),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return errorBlankInput(Strings.placeOfBirth);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        isUpdating
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : RoundedButton(
                                onClicked: () => actionUpdateProfile(),
                                label: Strings.save,
                                width: 130,
                                height: 36,
                                borderRadius: 20,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user?['avatar_url'] ?? Constants.placeholderAvatarUrl,
                  ),
                  radius: 42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
