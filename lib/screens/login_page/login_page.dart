import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sia_fect/core/bloc/login/login_bloc.dart';
import 'package:sia_fect/core/bloc/nre_data/nredata_bloc.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/services/validator_service.dart';
import 'package:sia_fect/core/widgets/rounded_button.dart';
import 'package:sia_fect/data/remote/api_services.dart';
import 'package:sia_fect/screens/home_page/home_page.dart';

enum UserType { dosente, estudante }

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginPageState extends State<LoginPage> {
  final ApiServices _apiServices = ApiServices();

  final _formKey = GlobalKey<FormState>();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool isLoading = false;
  bool isObsecured = true;
  // UserType? type;

  obsecureFunction() {
    setState(() {
      isObsecured = !isObsecured;
    });
  }

  void actionLogin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()
        //  &&
        // type != null
        ) {
      BlocProvider.of<LoginBloc>(context).add(FetchLogin(
          username: numberTextEditingController.text,
          password: passwordTextEditingController.text));
      
       BlocProvider.of<NredataBloc>(context).add(FetchNreData());
      // setState(() {
      //   isLoading = true;
      // });

      // final bool response = await _apiServices.login(
      //   registrationNumber: numberTextEditingController.text,
      //   password: passwordTextEditingController.text,
      //   type: type ?? UserType.dosente,
      // );

      // setState(() {
      //   isLoading = false;
      // });

      //   if (response) {
      //     if (!mounted) return;
      //     Navigator.pushReplacementNamed(context, HomePage.routeName);
      //   } else {
      //     if (!mounted) return;
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: const Text(
      //           Strings.notAuthorized,
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         duration: const Duration(milliseconds: 1000),
      //         backgroundColor: Colors.red.shade400,
      //       ),
      //     );
      //   }
      // } else {
      //   Timer(const Duration(seconds: 1), () {
      //     setState(() {
      //       isLoading = false;
      //     });
      //   });

      // if (type == null) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: const Text(
      //         Strings.errorEmptyTypeAccount,
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       duration: const Duration(milliseconds: 2000),
      //       backgroundColor: Colors.red.shade400,
      //     ),
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginDispose) {
              const CircularProgressIndicator();
              Future.delayed(const Duration(seconds: 2));
            }
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            }
            if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.messages.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  duration: const Duration(milliseconds: 1000),
                  backgroundColor: Colors.red.shade400,
                ),
              );
            }
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  color: ColorPallete.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                  ),
                ),
              ),
              Container(
                height: screenHeight - keyboardHeight,
                padding: const EdgeInsets.only(
                  // top: Platform.isAndroid ? 42 : 50,
                  right: 21,
                  left: 21,
                ),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Platform.isAndroid ? 44 : 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/images/untl-logo.svg',
                            semanticsLabel: 'UNTL',
                            width: 98,
                            height: 98,
                          ),
                          SvgPicture.asset(
                            'assets/images/fect-logo.svg',
                            semanticsLabel: 'FECT',
                            width: 88,
                            height: 88,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        Strings.fect,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      const Text(
                        Strings.fectDescription,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        Strings.login.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  const SizedBox(height: 4),
                                  TextFormField(
                                    controller: numberTextEditingController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      hintText: Strings.registrationNumber,
                                      counter: SizedBox.shrink(),
                                      contentPadding: EdgeInsets.all(16.0),
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return errorBlankInput(
                                            Strings.registrationNumber);
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  TextFormField(
                                    controller: passwordTextEditingController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            obsecureFunction();
                                          },
                                          icon: Icon((isObsecured)
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
                                      hintText: Strings.password,
                                      counter: const SizedBox.shrink(),
                                      contentPadding:
                                          const EdgeInsets.all(16.0),
                                      prefixIcon:
                                          const Icon(Icons.lock_open_rounded),
                                    ),
                                    obscureText: (isObsecured) ? true : false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return errorBlankInput(
                                            Strings.password);
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.center,
                                  //   children: [
                                  //     Expanded(
                                  //       child: Row(
                                  //         children: [
                                  //           Radio(
                                  //             value: UserType.dosente,
                                  //             groupValue: type,
                                  //             onChanged: (UserType? value) {
                                  //               setState(() {
                                  //                 type = value;
                                  //               });
                                  //             },
                                  //           ),
                                  //           const Text(
                                  //             Strings.lecturer,
                                  //             style: TextStyle(
                                  //               fontSize: 16,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     const SizedBox(width: 5),
                                  //     Expanded(
                                  //       child: Row(
                                  //         children: [
                                  //           Radio(
                                  //             value: UserType.estudante,
                                  //             groupValue: type,
                                  //             onChanged: (UserType? value) {
                                  //               setState(() {
                                  //                 type = value;
                                  //               });
                                  //             },
                                  //           ),
                                  //           const Text(
                                  //             Strings.student,
                                  //             style: TextStyle(
                                  //               fontSize: 16,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  const SizedBox(height: 32),
                                  // isLoading
                                  //     ? const Center(
                                  //         child: CircularProgressIndicator(),
                                  //       )
                                  //     :

                                  RoundedButton(
                                    onClicked: () => actionLogin(),
                                    label: Strings.login,
                                    width: 130,
                                    height: 36,
                                    borderRadius: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 21)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
