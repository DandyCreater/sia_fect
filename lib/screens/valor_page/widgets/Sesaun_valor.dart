import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/model/data_response_model.dart';

class NilaiSection extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  final bool isShow;
  final void Function(int) onPress;
  Transcript? transcript;
  Fre? fre;
  NilaiSection({
    Key? key,
    required this.onPress,
    this.isShow = false,
    required this.transcript,
    required this.fre
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   physics: const BouncingScrollPhysics(),
    //   shrinkWrap: true,
    //   controller: _controller,
      // itemCount: data['courses'] != null ? data['courses'].length : 0,
      // itemBuilder: (context, index) {
        // final course = data['courses'][index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            children: [
              // course['is_questionaire_done']
                  // ?
                   Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 146, 156, 153),
                            ),
                          ),
                          child: Text(
                           (fre != null  && transcript == null) ? fre!.numero! : (fre == null  && transcript != null) ? transcript!.numero! : "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 61, 211, 141),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 146, 156, 153),
                            ),
                          ),
                          child: Text(
                            // course['grade'] ?? '-',
                           (fre != null && transcript == null) ?  fre!.letra!  : (fre == null  && transcript != null) ? transcript!.letra! : "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  // : InkWell(
                  //     onTap: () => onPress(index),
                  //     child: Container(
                  //       width: 60,
                  //       height: 40,
                  //       alignment: Alignment.center,
                  //       decoration: const BoxDecoration(
                  //         border: Border(
                  //           right: BorderSide(
                  //             width: 1,
                  //             color: Color.fromARGB(255, 19, 18, 18),
                  //           ),
                  //         ),
                  //       ),
                  //       child: Column(
                  //         children: const [
                  //           Icon(Icons.remove_red_eye_outlined),
                  //           Text(
                  //             Strings.openScore,
                  //             style: TextStyle(
                  //               fontSize: 11,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        // course['course']['code'],
                       (fre != null) ? fre!.sigla! : (fre == null  && transcript != null) ? transcript!.sigla! : "",
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        // course['course']['name'],
                      (fre!= null  && transcript == null)  ? fre!.nomedisc! : (fre == null  && transcript != null) ? transcript!.nomedisc! : "",
                        style: const TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      // },
      // separatorBuilder: (context, index) => const SizedBox(height: 15),
      // padding: const EdgeInsets.only(bottom: 40),
    // );
  }
}
