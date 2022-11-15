import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/strings.dart';

class NilaiSection extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  final bool isShow;
  final void Function(int) onPress;
  final Map data;

  NilaiSection({
    Key? key,
    required this.onPress,
    this.isShow = false,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: _controller,
      itemCount: data['courses'] != null ? data['courses'].length : 0,
      itemBuilder: (context, index) {
        final course = data['courses'][index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: Row(
            children: [
              course['is_questionaire_done']
                  ? Column(
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
                            course['score'] ?? '-',
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
                            course['grade'] ?? '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: () => onPress(index),
                      child: Container(
                        width: 60,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 19, 18, 18),
                            ),
                          ),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.remove_red_eye_outlined),
                            Text(
                              Strings.openScore,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        course['course']['code'],
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        course['course']['name'],
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
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      padding: const EdgeInsets.only(bottom: 40),
    );
  }
}
