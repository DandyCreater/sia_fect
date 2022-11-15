// File valor_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_fect/core/bloc/login/login_bloc.dart';
import 'package:sia_fect/core/bloc/nre_data/nredata_bloc.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/model/data_response_model.dart';
import 'package:sia_fect/core/services/pdf_preview.dart';
import 'package:sia_fect/core/widgets/custom_appbar.dart';
import 'package:sia_fect/core/widgets/custom_bottom_bar.dart';
import 'package:sia_fect/data/dummy.dart';
import 'package:sia_fect/data/local/auth_services.dart';
import 'package:sia_fect/screens/valor_page/widgets/Sesaun_valor.dart';
import 'package:sia_fect/screens/valor_page/widgets/questionaire_dialog.dart';
import 'package:sia_fect/screens/valor_page/widgets/skripsi_section.dart';
import 'package:skeletons/skeletons.dart';

class ValorPage extends StatefulWidget {
  static const String routeName = '/valor';
  const ValorPage({Key? key}) : super(key: key);

  @override
  State<ValorPage> createState() => _ValorPageState();
}

class _ValorPageState extends State<ValorPage> {
  final AuthServices _authServices = AuthServices();

  List listYear = Dummy.studentYears;

  Map<String, dynamic>? user;
  String selectedYear = '2022 par';
  List scores = [];
  Map? scoreData;

  Mediafre? dropdownValue;
  String? media = "-";
  String? iP = "-";

  @override
  void initState() {
    BlocProvider.of<NredataBloc>(context).add(FetchNreData());
    setInitialData();
    super.initState();
  }

  void setInitialData() async {
    final userString = await _authServices.getUserData();
    final userData = jsonDecode(userString);

    final List listScore = userData['score'];
    listYear = Dummy.studentYears;
    selectedYear = listYear[0];
    scores = listScore;
    scoreData =
        listScore.firstWhere((element) => element['year'] == listYear[0]);

    setState(() {
      user = userData;
    });
  }

  showQuestionaireDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => QuestionaireDialog(
        data: scoreData?['courses'][index],
        onSubmit: () {
          // Update state to show score
          Map newScoreData = Map.of(scoreData!);
          newScoreData['courses'][index]['is_questionaire_done'] = true;
          setState(() {
            scoreData = newScoreData;
          });
        },
      ),
    );
  }

  Widget buildContentWidgets() {
    if (scoreData != null) {
      if (scoreData?['is_final']) {
        return SkripsiSection(data: scoreData!);
      } else {
        return NilaiSection(
          data: scoreData!,
          onPress: (index) => showQuestionaireDialog(context, index),
        );
      }
    } else {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            Strings.noData,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPallete.primary,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppBar(
            content: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginSuccess) {
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user?['avatar_url'] ??
                            Constants.placeholderAvatarUrl),
                        radius: 40,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.value!.nome!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.value!.username!.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const SkeletonAvatar();
              },
            ),
            size: 125,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorPallete.primary,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PdfPreviewPage(invoice: Dummy.pdfData),
                ),
              );
            },
            tooltip: Strings.download,
            child: const Icon(
              Icons.download,
              color: Colors.white,
              size: 26,
            ),
          ),
          extendBody: true,
          bottomNavigationBar: const CustomBottomBar(),
          // COPY PASTE ISI BODY
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              Strings.media.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              media!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Text(
                              Strings.ip.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              iP!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            Strings.academicYear,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<NredataBloc, NredataState>(
                            builder: (context, state) {
                              if (state is NredataSuccess) {
                                var data = state.value!.mediafre;
                                return DropdownButton(
                                  isExpanded: true,
                                  value: dropdownValue,
                                  items: data!.map((selectedDropdown) {
                                    return DropdownMenuItem(
                                      value: selectedDropdown,
                                      child: Text(
                                        "${selectedDropdown.tinan} ${selectedDropdown.tipo}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  }).toList(),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  onChanged: (Mediafre? value) {
                                    setState(() {
                                      dropdownValue = value;
                                      iP = value!.ip;
                                      media = value.totmediafre.toString();

                                      // selectedYear = value.toString();
                                      // scoreData = scores.firstWhere(
                                      //   (element) =>
                                      //       element['year'] == value.toString(),
                                      //   orElse: (() => null),
                                      // );
                                    });
                                  },
                                );
                              }
                              return const SkeletonAvatar();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: buildContentWidgets()),
            ],
          ),
        ),
      ),
    );
  }
}
