import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/data/dummy.dart';
import 'package:sia_fect/screens/e_learning/widgets/items_section.dart';

class ELearningPage extends StatefulWidget {
  static const String routeName = '/e-learning';

  const ELearningPage({Key? key}) : super(key: key);

  @override
  State<ELearningPage> createState() => _ELearningPageState();
}

class _ELearningPageState extends State<ELearningPage> {
  List myShedule = [];

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  setInitialData() {
    setState(() {
      myShedule = List.from(Dummy.courses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            expandedHeight: 200,
            pinned: true,
            floating: true,
            elevation: 0,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.network(
                    "https://img.rasset.ie/001b24de-1200.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        Strings.eLearning,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ItemsSection(data: myShedule[index]),
              childCount: myShedule.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          )
        ],
      ),
    );
  }
}
