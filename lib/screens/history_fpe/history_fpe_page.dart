import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/dummy.dart';

class HistoryFPEPage extends StatefulWidget {
  static const String routeName = '/history-fpe';
  const HistoryFPEPage({Key? key}) : super(key: key);

  @override
  State<HistoryFPEPage> createState() => _HistoryFPEPageState();
}

class _HistoryFPEPageState extends State<HistoryFPEPage> {
  final ScrollController _controller = ScrollController();
  List fpeList = [];

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  setInitialData() {
    setState(() {
      fpeList = List.from(Dummy.historyFpe);
    });
  }

  List<Widget> _generateCourseItems(Map data) {
    List<Widget> widgetList = [];
    for (var i = 0; i < data['courses'].length; i++) {
      final course = data['courses'];
      widgetList.add(
        Container(
          color: Colors.grey.shade50,
          margin: const EdgeInsets.only(bottom: 5),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                size: 12,
                color: Colors.black.withOpacity(0.3),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  course[i]['name'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '${Strings.class_}: ${course[i]['class']}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.historyFPE,
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
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemCount: fpeList.length,
        shrinkWrap: true,
        controller: _controller,
        itemBuilder: (context, index) {
          final fpe = fpeList[index];
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fpe['year'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      fpe['date'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: _generateCourseItems(fpe),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 2),
      ),
    );
  }
}
