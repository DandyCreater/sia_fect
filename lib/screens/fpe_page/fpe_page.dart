import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/widgets/custom_appbar.dart';
import 'package:sia_fect/core/widgets/custom_bottom_bar.dart';
import 'package:sia_fect/core/widgets/rounded_button.dart';
import 'package:sia_fect/data/dummy.dart';

class FPEPage extends StatefulWidget {
  static const String routeName = '/fpe';
  const FPEPage({Key? key}) : super(key: key);

  @override
  State<FPEPage> createState() => _FPEPageState();
}

class _FPEPageState extends State<FPEPage> {
  final ScrollController _controller = ScrollController();
  List courses = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setInitialData();
  }

  setInitialData() {
    setState(() {
      courses = List.from(Dummy.courses);
    });
  }

  updateClass(int index, String newClass) {
    Map newCourse = Map.of(courses[index]);
    newCourse['selected_class'] = newClass;
    List newCourses = courses;
    newCourses[index] = newCourse;

    setState(() {
      courses = [...newCourses];
    });
  }

  submitForm() {
    setState(() {
      _isLoading = true;
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            Strings.sentSuccess,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(milliseconds: 1000),
          backgroundColor: Colors.blue,
        ),
      );

      Navigator.pop(context, 'open_history');
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLecturer =
        ModalRoute.of(context)!.settings.arguments != null ? true : false;

    return Container(
      color: ColorPallete.primary,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppBar(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  Strings.formPlanning,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  Strings.currentSemestre,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            size: 125,
          ),
          extendBody: true,
          bottomNavigationBar: const CustomBottomBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                isLecturer
                    ? const SizedBox.shrink()
                    : Container(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, right: 16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: const [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${Strings.codeSubject}\n${Strings.subject}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    Strings.class_,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            ListView.separated(
                              padding: const EdgeInsets.only(top: 8),
                              itemCount: courses.length,
                              shrinkWrap: true,
                              controller: _controller,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      index == 0
                                          ? Row(
                                              children: [
                                                Container(
                                                  width: 30,
                                                  alignment: Alignment.center,
                                                ),
                                                const Expanded(
                                                  flex: 1,
                                                  child: Text(''),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      // Tambahkan label kelas baru disini
                                                      SizedBox(
                                                        width: 40,
                                                        child: Text(
                                                          'A',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                        child: Text(
                                                          'B',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                        child: Text(
                                                          'C',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            alignment: Alignment.center,
                                            child: Text(
                                              (index + 1).toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${courses[index]['code']}\n${courses[index]['name']}',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Tambahkan radio button kelas baru disini
                                                SizedBox(
                                                  width: 40,
                                                  child: IconButton(
                                                    icon: Icon(courses[index][
                                                                'selected_class'] ==
                                                            'A'
                                                        ? Icons
                                                            .radio_button_checked
                                                        : Icons
                                                            .radio_button_off),
                                                    onPressed: () {
                                                      updateClass(index, 'A');
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                  child: IconButton(
                                                    icon: Icon(courses[index][
                                                                'selected_class'] ==
                                                            'B'
                                                        ? Icons
                                                            .radio_button_checked
                                                        : Icons
                                                            .radio_button_off),
                                                    onPressed: () {
                                                      updateClass(index, 'B');
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 40,
                                                  child: IconButton(
                                                    icon: Icon(courses[index][
                                                                'selected_class'] ==
                                                            'C'
                                                        ? Icons
                                                            .radio_button_checked
                                                        : Icons
                                                            .radio_button_off),
                                                    onPressed: () {
                                                      updateClass(index, 'C');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _isLoading
                                      ? const SizedBox(
                                          width: 130,
                                          height: 36,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : RoundedButton(
                                          onClicked: submitForm,
                                          label: Strings.submit,
                                          width: 130,
                                          height: 36,
                                          borderRadius: 20,
                                        ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
