import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_fect/core/bloc/login/login_bloc.dart';
import 'package:sia_fect/core/bloc/nre_data/nredata_bloc.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/local/auth_services.dart';
import 'package:sia_fect/screens/curriculum_page/curriculum_page.dart';
import 'package:sia_fect/screens/e_learning/e_learning.dart';
import 'package:sia_fect/screens/e_learning/e_learning_student.dart';
import 'package:sia_fect/screens/fpe_page/fpe_page.dart';
import 'package:sia_fect/screens/history_fpe/history_fpe_page.dart';
import 'package:sia_fect/screens/home_page/widgets/bottom_nav_bar.dart';
import 'package:sia_fect/screens/home_page/widgets/menu_card.dart';
import 'package:sia_fect/screens/home_page/widgets/qrcode_screen.dart';
import 'package:sia_fect/screens/notification_page/notification_page.dart';
import 'package:sia_fect/screens/schedule_page/schedule_page.dart';
import 'package:sia_fect/screens/transkrisaun_page/transkrisaun_page.dart';
import 'package:sia_fect/screens/valor_page/valor_estudante_page.dart';
import 'package:sia_fect/screens/valor_page/valor_page.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthServices _authServices = AuthServices();
  Map<String, dynamic>? user;
  List<Widget> menus = [];

  void openQRCode(BuildContext context) {
    showDialog(context: context, builder: (context) => const QRCodeScreen());
  }

  @override
  void initState() {
    // setInitialData();
   

    setMenus();
    super.initState();
  }

  void setMenus() async {
    setState(() {
      final studentMenus = [
        MenuCard(
          label: Strings.valor,
          icon: 'assets/icons/ic-cc.svg',
          onPress: () {
            Navigator.pushNamed(context, ValorPage.routeName);
          },
        ),
        MenuCard(
          label: Strings.transkrisaun,
          icon: 'assets/icons/ic-layer.svg',
          onPress: () {
            Navigator.pushNamed(context, TranskrisaunPage.routeName);
          },
        ),
        MenuCard(
          label: Strings.horario,
          icon: 'assets/icons/ic-server.svg',
          onPress: () {
            Navigator.pushNamed(context, SchedulePage.routeName);
          },
        ),
        MenuCard(
          label: Strings.curriculum,
          icon: 'assets/icons/ic-slider.svg',
          onPress: () {
            Navigator.pushNamed(context, CurriculumPage.routeName);
          },
        ),
        MenuCard(
          label: Strings.fpe,
          icon: 'assets/icons/ic-clipboard.svg',
          onPress: () async {
            final result =
                await Navigator.pushNamed(context, FPEPage.routeName);
            if (result == 'open_history') {
              // Timer(const Duration(seconds: 2), () {
              //   Navigator.pushNamed(context, HistoryFPEPage.routeName);
              // });
            }
          },
        ),
        MenuCard(
          label: Strings.historyFPE,
          icon: 'assets/icons/ic-clock.svg',
          onPress: () {
            Navigator.pushNamed(context, HistoryFPEPage.routeName);
          },
        ),
        MenuCard(
          label: Strings.eLearning,
          icon: 'assets/icons/ic-monitor.svg',
          onPress: () {
            Navigator.pushNamed(context, ELearningStudentPage.routeName);
          },
        ),
      ];
      menus = studentMenus;
    });
  }

  //ini gakepake berarti ya
  void setInitialData() async {
    final userString = await _authServices.getUserData();
    setState(() {
      user = jsonDecode(userString);
    });

    if (user?['user_type'] == 'student') {
      setState(() {
        final studentMenus = [
          MenuCard(
            label: Strings.valor,
            icon: 'assets/icons/ic-cc.svg',
            onPress: () {
              Navigator.pushNamed(context, ValorPage.routeName);
            },
          ),
          MenuCard(
            label: Strings.transkrisaun,
            icon: 'assets/icons/ic-layer.svg',
            onPress: () {
              Navigator.pushNamed(context, TranskrisaunPage.routeName);
            },
          ),
          MenuCard(
            label: Strings.horario,
            icon: 'assets/icons/ic-server.svg',
            onPress: () {
              Navigator.pushNamed(context, SchedulePage.routeName);
            },
          ),
          MenuCard(
            label: Strings.curriculum,
            icon: 'assets/icons/ic-slider.svg',
            onPress: () {
              Navigator.pushNamed(context, CurriculumPage.routeName);
            },
          ),
          MenuCard(
            label: Strings.fpe,
            icon: 'assets/icons/ic-clipboard.svg',
            onPress: () async {
              final result =
                  await Navigator.pushNamed(context, FPEPage.routeName);
              if (result == 'open_history') {
                // Timer(const Duration(seconds: 2), () {
                //   Navigator.pushNamed(context, HistoryFPEPage.routeName);
                // });
              }
            },
          ),
          MenuCard(
            label: Strings.historyFPE,
            icon: 'assets/icons/ic-clock.svg',
            onPress: () {
              Navigator.pushNamed(context, HistoryFPEPage.routeName);
            },
          ),
          MenuCard(
            label: Strings.eLearning,
            icon: 'assets/icons/ic-monitor.svg',
            onPress: () {
              Navigator.pushNamed(context, ELearningStudentPage.routeName);
            },
          ),
        ];
        menus = studentMenus;
      });
    } else {
      final lecturerMenus = [
        MenuCard(
          label: Strings.valorEstudante,
          icon: 'assets/icons/ic-tv.svg',
          onPress: () {
            Navigator.pushNamed(context, ValorEstudantePage.routeName);
          },
        ),
        MenuCard(
          label: Strings.horario,
          icon: 'assets/icons/ic-server.svg',
          onPress: () {
            Navigator.pushNamed(context, SchedulePage.routeName);
          },
        ),
        MenuCard(
          label: Strings.fpe,
          icon: 'assets/icons/ic-clipboard.svg',
          onPress: () {
            const isLecture = true;
            Navigator.pushNamed(context, FPEPage.routeName,
                arguments: isLecture);
          },
        ),
        MenuCard(
          label: Strings.eLearning,
          icon: 'assets/icons/ic-monitor.svg',
          onPress: () {
            Navigator.pushNamed(context, ELearningPage.routeName);
          },
        ),
      ];
      setState(() {
        menus = lecturerMenus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 3,
        icon: const Icon(Icons.qr_code),
        label: const Text(Strings.qrCode),
        onPressed: () => openQRCode(context),
        backgroundColor: ColorPallete.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(onTap: (index) {
        if (index == 1) {
          Navigator.pushNamed(context, NotificationPage.routeName);
        }
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Text(
                Strings.welcome,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 50),
                        padding: const EdgeInsets.only(top: 24, bottom: 10),
                        decoration: const BoxDecoration(
                          color: ColorPallete.primary,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: SizedBox(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginSuccess) {
                                return ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    // Lecturer
                                    if (index == 1) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 12),
                                            const Text(
                                              Strings.adviser,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            // const SizedBox(height: 12),
                                            Text(
                                              user?['lecturer']['name'] ?? '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              user?['lecturer']
                                                      ['registration_number'] ??
                                                  '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 12),
                                          ],
                                        ),
                                      );
                                    }
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(height: 30),
                                          Text(
                                            state.value!.nome!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            state.value!.username!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                      ),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                );
                              }
                              return const SkeletonAvatar();
                            },
                          ),
                        ),

                        //ini ku comment jg ya
                        // child: SizedBox(
                        //   height: 140,
                        //   width: MediaQuery.of(context).size.width,
                        //   child: user?['user_type'] == 'student'
                        //       ? ListView.builder(
                        //           itemCount: 2,
                        //           itemBuilder: (context, index) {
                        //             // Lecturer
                        //             if (index == 1) {
                        //               return SizedBox(
                        //                 width:
                        //                     MediaQuery.of(context).size.width,
                        //                 child: Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     const SizedBox(height: 12),
                        //                     const Text(
                        //                       Strings.adviser,
                        //                       style: TextStyle(
                        //                         color: Colors.white,
                        //                         fontSize: 14,
                        //                       ),
                        //                     ),
                        //                     // const SizedBox(height: 12),
                        //                     Text(
                        //                       user?['lecturer']['name'] ?? '',
                        //                       style: const TextStyle(
                        //                         color: Colors.white,
                        //                         fontSize: 26,
                        //                         fontWeight: FontWeight.bold,
                        //                       ),
                        //                     ),
                        //                     const SizedBox(height: 8),
                        //                     Text(
                        //                       user?['lecturer']
                        //                               ['registration_number'] ??
                        //                           '',
                        //                       style: const TextStyle(
                        //                         color: Colors.white,
                        //                         fontSize: 22,
                        //                         fontWeight: FontWeight.bold,
                        //                       ),
                        //                       textAlign: TextAlign.center,
                        //                     ),
                        //                     const SizedBox(height: 12),
                        //                   ],
                        //                 ),
                        //               );
                        //             }
                        //             return SizedBox(
                        //               width: MediaQuery.of(context).size.width,
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   const SizedBox(height: 30),
                        //                   Text(
                        //                     user?['name'] ?? '',
                        //                     style: const TextStyle(
                        //                       color: Colors.white,
                        //                       fontSize: 26,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   const SizedBox(height: 8),
                        //                   Text(
                        //                     user?['registration_number'] ?? '',
                        //                     style: const TextStyle(
                        //                       color: Colors.white,
                        //                       fontSize: 22,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                     textAlign: TextAlign.center,
                        //                   ),
                        //                   const SizedBox(height: 12),
                        //                 ],
                        //               ),
                        //             );
                        //           },
                        //           scrollDirection: Axis.horizontal,
                        //         )
                        //       : SizedBox(
                        //           width: MediaQuery.of(context).size.width,
                        //           child: Column(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               const SizedBox(height: 30),
                        //               Text(
                        //                 user?['name'] ?? '',
                        //                 style: const TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 26,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //               const SizedBox(height: 8),
                        //               Text(
                        //                 user?['registration_number'] ?? '',
                        //                 style: const TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 22,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //                 textAlign: TextAlign.center,
                        //               ),
                        //               const SizedBox(height: 12),
                        //             ],
                        //           ),
                        //         ),
                        // ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: menus,
                      ),
                      const SizedBox(height: 40)
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        user?['avatar_url'] ?? Constants.placeholderAvatarUrl),
                    radius: 46,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
