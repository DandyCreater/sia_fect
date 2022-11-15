import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/widgets/rounded_button.dart';
import 'package:sia_fect/data/dummy.dart';

class QuestionaireDialog extends StatefulWidget {
  final Map data;
  final Function() onSubmit;

  const QuestionaireDialog({
    Key? key,
    required this.data,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<QuestionaireDialog> createState() => _QuestionaireDialogState();
}

class _QuestionaireDialogState extends State<QuestionaireDialog> {
  List listSelectedOption = [];

  @override
  void initState() {
    super.initState();
    for (var element in Dummy.questionnaires) {
      listSelectedOption.add(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          Strings.avaliacao,
        ),
        backgroundColor: ColorPallete.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: ColorPallete.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  Strings.pengajar,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(Constants.placeholderAvatarUrl),
                      radius: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.data['course']['lecture'] ?? '-',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 12),
              shrinkWrap: true,
              children: List.generate(Dummy.questionnaires.length, (index) => index).map(
                (e) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${e + 1}. ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: Dummy.questionnaires[e]['question'].toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Dummy.questionnaires[e]['type'] == 'choice'
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Column(
                                  children: List.generate(
                                      (Dummy.questionnaires[e]['options'] as List).length, (index) => index).map((f) {
                                    final options = Dummy.questionnaires[e]['options'] as List;

                                    return RadioListTile(
                                      title: Text(options[f].toString()),
                                      value: f,
                                      groupValue: listSelectedOption[e],
                                      contentPadding: const EdgeInsets.all(0),
                                      onChanged: (value) {
                                        List newList = List.from(listSelectedOption);
                                        newList[e] = value as int;

                                        setState(() {
                                          listSelectedOption = newList;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              )
                            : Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      hintText: 'type here',
                                      counter: SizedBox.shrink(),
                                      contentPadding: EdgeInsets.all(16.0),
                                    ),
                                    onChanged: (value) {
                                      List newList = List.from(listSelectedOption);
                                      newList[e] = value;

                                      setState(() {
                                        listSelectedOption = newList;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                        (e + 1 == Dummy.questionnaires.length)
                            ? Column(
                                children: [
                                  const SizedBox(height: 20),
                                  RoundedButton(
                                    onClicked: () {
                                      bool isComplete = true;

                                      for (var element in listSelectedOption) {
                                        if (element == null) {
                                          isComplete = false;
                                        }
                                      }

                                      if (isComplete) {
                                        widget.onSubmit();
                                        Navigator.pop(context);
                                      } else {
                                        if (!mounted) return;
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                              Strings.errorField,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            duration: const Duration(milliseconds: 1000),
                                            backgroundColor: Colors.red.shade400,
                                          ),
                                        );
                                      }
                                    },
                                    label: Strings.submit,
                                    width: 130,
                                    height: 36,
                                    borderRadius: 20,
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
