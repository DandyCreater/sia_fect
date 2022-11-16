import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_fect/core/bloc/login/login_bloc.dart';
import 'package:sia_fect/core/bloc/nre_data/nredata_bloc.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/local/auth_services.dart';
import 'package:sia_fect/screens/curriculum_page/curriculum_page.dart';
import 'package:sia_fect/screens/e_learning/e_learning.dart';
import 'package:sia_fect/screens/e_learning/e_learning_student.dart';
import 'package:sia_fect/screens/edit_profile_page/edit_profile_page.dart';
import 'package:sia_fect/screens/fpe_page/fpe_page.dart';
import 'package:sia_fect/screens/history_fpe/history_fpe_page.dart';
import 'package:sia_fect/screens/home_page/home_page.dart';
import 'package:sia_fect/screens/login_page/login_page.dart';
import 'package:sia_fect/screens/notification_page/notification_page.dart';
import 'package:sia_fect/screens/profile_page/profile_page.dart';
import 'package:sia_fect/screens/schedule_page/schedule_page.dart';
import 'package:sia_fect/screens/transkrisaun_page/transkrisaun_page.dart';
import 'package:sia_fect/screens/valor_page/valor_estudante_page.dart';
import 'package:sia_fect/screens/valor_page/valor_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices _authServices = AuthServices();
  bool? isLoggedIn;

  getUserToken() async {
    final String token = await _authServices.getToken() ?? '';
    if (token != '') {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  void initState() {
    getUserToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoggedIn == null)
        ? Container(
            color: ColorPallete.primary,
          )
        : MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => LoginBloc()),
              BlocProvider(create: (_) => NredataBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              theme: ThemeData(
                colorScheme: ThemeData()
                    .colorScheme
                    .copyWith(primary: ColorPallete.primary),
              ),
              initialRoute:
                  isLoggedIn == true ? HomePage.routeName : LoginPage.routeName,
              routes: {
                LoginPage.routeName: (context) => const LoginPage(),
                HomePage.routeName: (context) => const HomePage(),
                NotificationPage.routeName: (context) =>
                    const NotificationPage(),
                ProfilePage.routeName: (context) => const ProfilePage(),
                ValorPage.routeName: (context) => const ValorPage(),
                // ValorEstudantePage.routeName: (context) =>
                //     const ValorEstudantePage(),
                EditProfilePage.routeName: (context) => const EditProfilePage(),
                TranskrisaunPage.routeName: (context) =>
                    const TranskrisaunPage(),
                FPEPage.routeName: (context) => const FPEPage(),
                CurriculumPage.routeName: (context) => const CurriculumPage(),
                ELearningPage.routeName: (context) => const ELearningPage(),
                ELearningStudentPage.routeName: (context) =>
                    const ELearningStudentPage(),
                SchedulePage.routeName: (context) => const SchedulePage(),
                HistoryFPEPage.routeName: (context) => const HistoryFPEPage(),
              },
            ),
          );
  }
}
