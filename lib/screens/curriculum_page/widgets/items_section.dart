import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/strings.dart';

class ItemsSection extends StatelessWidget {
  final List data;

  const ItemsSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Column(
                children: [
                  index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 30,
                                alignment: Alignment.center,
                                child: const Text(
                                  Strings.no,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  Strings.codeMateri,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 44,
                                child: Text(
                                  Strings.kred,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    Strings.kalHoras,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 30,
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                          ),
                                        ),
                                        child: const Text(
                                          Strings.at,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 1),
                                            right: BorderSide(width: 1),
                                            bottom: BorderSide(width: 1),
                                          ),
                                        ),
                                        child: const Text(
                                          Strings.ap,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 1),
                                            right: BorderSide(width: 1),
                                            bottom: BorderSide(width: 1),
                                          ),
                                        ),
                                        child: const Text(
                                          Strings.ea,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 44,
                                child: Text(
                                  Strings.ths,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${data[index]['code']} / ${data[index]['name']}',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: 44,
                        child: Text(
                          data[index]['kred'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Text(
                              data[index]['at'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              data[index]['ap'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Text(
                              data[index]['ea'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 44,
                        child: Text(
                          data[index]['th/s'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          childCount: data.length, // 1000 list items
        ),
      ),
    );
  }
}
