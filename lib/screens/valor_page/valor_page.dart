// File valor_page.dart

// ignore_for_file: await_only_futures

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sia_fect/core/bloc/login/login_bloc.dart';
import 'package:sia_fect/core/bloc/nre_data/nredata_bloc.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/model/data_response_model.dart';
import 'package:sia_fect/core/model/login_response_model.dart';
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
  final storage = const FlutterSecureStorage();

  List listYear = Dummy.studentYears;

  Map<String, dynamic>? user;
  String selectedYear = '2022 par';
  String year = '2013';
  String semester = 'Impar';
  List scores = [];
  Map? scoreData;

  Mediafre? dropdownValue;
  String? media = "0";
  String? iP = "0.00";
  int index = 0;

  @override
  void initState() {
    // BlocProvider.of<NredataBloc>(context).add(FetchNreData());
    // setInitialData();
    super.initState();
  }

  // void setInitialData() async {
  //   // final userString = await _authServices.getUserData();
  //   // final userData = jsonDecode(userString);
  //   // final List listScore = userData['score'];

  //   String? jsonData = await storage.read(
  //       key: "loginKey", aOptions: AndroidOptions.defaultOptions);
  //   var decodeData = jsonDecode(jsonData!);
  //   var data = LoginResponseModel.fromJson(jsonDecode(decodeData));

  //   var dummyData;
  //   if(data.nre == "098"){
  //     setState(() {
  //       dummyData = Dummy.studentA;
  //     });
  //   }
  //   else if(data.nre == "099"){
  //     dummyData = Dummy.studentB;
  //   }
  //   else{
  //     dummyData = Dummy.studentC;
  //   }
  //   final userString = dummyData;
  //   final userData = jsonDecode(jsonEncode(userString));
  //   final List listScore = userData["score"];
  //   listYear = Dummy.studentYears;
  //   selectedYear = listYear[0];
  //   scores = listScore;

  //   // scoreData =
  //   //     listScore.firstWhere((element) => element['year'] == listYear[0]);

  //   // listYear[0]);

  //   setState(() {
  //     user = userData;
  //   });
  // }

  // Widget buildContentWidgets() {
  //   if (scoreData != null) {
  //     if (scoreData?['is_final']) {
  //       return SkripsiSection(data: scoreData!);
  //     } else {
  //       return NilaiSection(
  //         data: scoreData!,
  //         onPress: (index) => showQuestionaireDialog(context, index),
  //       );
  //     }
  //   } else {
  //     return const Padding(
  //       padding: EdgeInsets.all(24.0),
  //       child: Center(
  //         child: Text(
  //           Strings.noData,
  //           style: TextStyle(color: Colors.grey),
  //         ),
  //       ),
  //     );
  //   }
  // }

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
          body: BlocListener<NredataBloc, NredataState>(
            listener: (context, state) {
              if (state is NredataSuccess) {
                setState(() {
                  dropdownValue = state.value!.mediafre!.first;
                });
              }
            },
            child: Column(
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
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      value: dropdownValue,
                                      isExpanded: true,
                                      hint: Text(
                                        'Select Item',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
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
                                      onChanged: (Mediafre? value) {
                                        setState(() {
                                          dropdownValue = value;
                                          iP = value!.ip;
                                          media = value.totmediafre.toString();
                                          selectedYear =
                                              "${value.tinan.toString()} ${value.tipo.toString()}";

                                          year = value.tinan.toString();
                                          semester = value.tipo.toString();

                                          scoreData = scores.firstWhere(
                                              (element) =>
                                                  element['year'] ==
                                                  selectedYear.toString(),
                                              orElse: (() => null));
                                        });
                                      },
                                      buttonHeight: 40,
                                      buttonWidth: 140,
                                      itemHeight: 50,
                                      dropdownMaxHeight: 400,
                                    ),
                                  );

                                  // DropdownButton(
                                  //   isExpanded: true,
                                  //   value: dropdownValue,
                                  //   items: data!.map((selectedDropdown) {
                                  //     return DropdownMenuItem(
                                  //       value: selectedDropdown,
                                  //       child: Text(
                                  //         "${selectedDropdown.tinan} ${selectedDropdown.tipo}",
                                  //         style: const TextStyle(
                                  //             color: Colors.black),
                                  //         textAlign: TextAlign.left,
                                  //       ),
                                  //     );
                                  //   }).toList(),
                                  //   icon: const Icon(
                                  //     Icons.arrow_drop_down,
                                  //     color: Colors.black,
                                  //     size: 40,
                                  //   ),
                                  // onChanged: (Mediafre? value) {
                                  //   setState(() {
                                  //     dropdownValue = value;
                                  //     iP = value!.ip;
                                  //     media = value.totmediafre.toString();
                                  //     selectedYear =
                                  //         "${value.tinan.toString()} ${value.tipo.toString()}";

                                  //     year = value.tinan.toString();
                                  //     semester = value.tipo.toString();

                                  //     scoreData = scores.firstWhere(
                                  //         (element) =>
                                  //             element['year'] ==
                                  //             selectedYear.toString(),
                                  //         orElse: (() => null));
                                  //   });
                                  // },
                                  // );
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
                // Expanded(flex: 1, child:
                // buildContentWidgets()
                // ),
                Expanded(
                  flex: 1,
                  child: BlocBuilder<NredataBloc, NredataState>(
                      builder: (context, state) {
                    if (state is NredataSuccess) {
                      var items = state.value!.mediafre!;
                      DataResponseModel? data = DataResponseModel();
                      List<Mediafre> dataitem = items
                          .where((element) =>
                              element.tinan!.contains(year) &&
                              element.tipo!.contains(semester))
                          .toList();
                      data.mediafre = dataitem;
                      var freData = data.mediafre![0].fre!;
                      var conditionsData = freData.toString();
                      if (conditionsData != "[]") {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 16, right: 16),
                          itemCount: freData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NilaiSection(
                              onPress: (value) {},
                              fre: freData[index],
                              transcript: null,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 0),
                        );
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
                    return const SkeletonAvatar();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
