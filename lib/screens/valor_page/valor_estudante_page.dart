import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_fect/core/bloc/nre_data/nredata_bloc.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/services/pdf_preview.dart';
import 'package:sia_fect/core/widgets/custom_appbar.dart';
import 'package:sia_fect/core/widgets/custom_bottom_bar.dart';
import 'package:sia_fect/data/dummy.dart';
import 'package:sia_fect/screens/valor_page/widgets/Sesaun_valor.dart';
import 'package:sia_fect/screens/valor_page/widgets/skripsi_section.dart';

class ValorEstudantePage extends StatefulWidget {
  static const String routeName = '/valor-estudante';
  final String? scores;
  const ValorEstudantePage({Key? key, required this.scores}) : super(key: key);

  @override
  State<ValorEstudantePage> createState() => _ValorEstudantePageState();
}

class _ValorEstudantePageState extends State<ValorEstudantePage> {
  List listYear = Dummy.lectureYears;

  Map<String, dynamic>? user;
  String selectedYear = '2022';
  List scores = [];

  @override
  void initState() {
    // setInitialData();
    super.initState();
  }

  void setInitialData() async {
    setState(() {
      selectedYear = listYear[0];
      scores = Dummy.listScoreLecturer;
      // user = scores
      //     .firstWhere((element) => element['year'] == listYear[0])['user'];
    });
  }

  // Widget buildContentWidgets() {
    // List<Widget> widgets = [];

    // if (user?['score'].isNotEmpty) {
    //   for (var e in user?['score']) {
    //     if (e?['is_final']) {
    //       widgets.add(
    //         SkripsiSection(data: e!),
    //       );
    //     } else {
    //       widgets.add(
    //         NilaiSection(
    //           data: e!,
    //           onPress: (index) {},
    //         ),
    //       );
    //     }
    //   }
    //   return Column(
    //     children: widgets,
    //   );
    // } else {
    //   return const Padding(
    //     padding: EdgeInsets.all(24.0),
    //     child: Center(
    //       child: Text(
    //         Strings.noData,
    //         style: TextStyle(color: Colors.grey),
    //       ),
    //     ),
    //   );
    // }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPallete.primary,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppBar(
            content: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      user?['avatar_url'] ?? Constants.placeholderAvatarUrl),
                  radius: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?['name'] ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user?['registration_number'] ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
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
          body: BlocBuilder<NredataBloc, NredataState>(
            builder: (context, state) {
              if (state is NredataSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 0),
                      child: Row(
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
                                user?['Media'] ?? '-',
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
                                state.value!.mediaipc![0].ipk.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 16),
                      child: Row(
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
                            child: DropdownButton(
                              isExpanded: true,
                              value: selectedYear,
                              items: listYear.map((selectedDropdown) {
                                return DropdownMenuItem(
                                  value: selectedDropdown,
                                  child: Text(
                                    selectedDropdown,
                                    style: const TextStyle(color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                );
                              }).toList(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 40,
                              ),
                              onChanged: (value) {
                                try {
                                  final data = scores.firstWhere(
                                      (element) => element['year'] == value);
                                  setState(() {
                                    selectedYear = value.toString();
                                    user = data['user'];
                                  });
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        Strings.noData,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(milliseconds: 1000),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: ListView.separated(
                    //     padding: const EdgeInsets.only(
                    //         top: 8, bottom: 8, left: 16, right: 16),
                    //     itemCount: user?['score'].length,
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) {
                    //       final data = user?['score'];
                    //       if (data[index]['is_final']) {
                    //         SkripsiSection(data: data);
                    //       }
                    //       return NilaiSection(
                    //         data: data[index],
                    //         onPress: (index) {},
                    //       );
                    //     },
                    //     separatorBuilder: (context, index) =>
                    //         const SizedBox(height: 0),
                    //   ),
                    // ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
