import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/dummy.dart';
import 'package:sia_fect/screens/schedule_page/widgets/items_section.dart';

class SchedulePage extends StatefulWidget {
  static const String routeName = '/schedule';

  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List myShedule = [];

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  setInitialData() {
    setState(() {
      myShedule = List.from(Dummy.scheduleStudent);
    });
  }

  List<Widget> _generateSliverList() {
    List<Widget> widgetList = [];
    for (var i = 0; i < myShedule.length; i++) {
      widgetList.add(SliverStickyHeader(
        header: Container(
          height: 50.0,
          color: Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "${myShedule[i]['day']} - ${myShedule[i]['date']}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        sliver: ItemsSection(listData: myShedule[i]['courses']),
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
          Strings.schedule,
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
