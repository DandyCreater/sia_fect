import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/dummy.dart';
import 'package:sia_fect/screens/curriculum_page/widgets/items_section.dart';

class CurriculumPage extends StatefulWidget {
  static const String routeName = '/curriculum';

  const CurriculumPage({Key? key}) : super(key: key);

  @override
  State<CurriculumPage> createState() => _CurriculumPageState();
}

class _CurriculumPageState extends State<CurriculumPage> {
  List dataCurriculum = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      dataCurriculum = Dummy.curriculumData;
    });
  }

  List<Widget> _generateSliverList() {
    List<Widget> widgetList = [];
    for (var i = 0; i < dataCurriculum.length; i++) {
      widgetList.add(SliverStickyHeader(
        header: Container(
          height: 50.0,
          color: Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.center,
          child: Text(
            dataCurriculum[i]['name'].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        sliver: ItemsSection(data: dataCurriculum[i]['summary']),
      ));
    }
    widgetList.add(SliverStickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.transparent,
        alignment: Alignment.center,
      ),
      sliver: const SliverPadding(padding: EdgeInsets.all(0)),
    ));
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.curriculum,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
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
      body: CustomScrollView(
        slivers: _generateSliverList(),
      ),
    );
  }
}
