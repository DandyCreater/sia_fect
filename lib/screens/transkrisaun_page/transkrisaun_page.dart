import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/constants.dart';
import 'package:sia_fect/core/const/strings.dart';
import 'package:sia_fect/core/services/pdf_preview.dart';
import 'package:sia_fect/core/widgets/custom_appbar.dart';
import 'package:sia_fect/core/widgets/custom_bottom_bar.dart';
import 'package:sia_fect/data/dummy.dart';
import 'package:sia_fect/data/local/auth_services.dart';
import 'package:sia_fect/screens/valor_page/widgets/Sesaun_valor.dart';
import 'package:sia_fect/screens/valor_page/widgets/skripsi_section.dart';

class TranskrisaunPage extends StatefulWidget {
  static const String routeName = '/transkrisaun';
  const TranskrisaunPage({Key? key}) : super(key: key);

  @override
  State<TranskrisaunPage> createState() => _TranskrisaunPageState();
}

class _TranskrisaunPageState extends State<TranskrisaunPage> {
  final AuthServices _authServices = AuthServices();

  List listYear = Dummy.studentYears;

  Map<String, dynamic>? user;
  List scores = [];
  Map? scoreData;

  @override
  void initState() {
    // setInitialData();
    super.initState();
  }

  void setInitialData() async {
    final userString = await _authServices.getUserData();
    final userData = jsonDecode(userString);
    final List listScore = userData['score'];

    listYear = Dummy.studentYears;
    scores = listScore;
    scoreData = listScore[0];

    setState(() {
      user = userData;
    });
  }

  Widget buildContentWidgets() {
    List<Widget> widgets = [];

    if (scores.isNotEmpty) {
      for (var e in scores) {
        if (e?['is_final']) {
          widgets.add(
            SkripsiSection(data: e!),
          );
        } else {
          widgets.add(
            NilaiSection(
              data: e!,
              onPress: (index) {},
            ),
          );
        }
      }
      return Column(
        children: widgets,
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            Strings.noData,
            style: TextStyle(color: Color.fromARGB(255, 255, 249, 249)),
          ),
        ),
      );
    }
  }

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
          body: Column(
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
                          scoreData?['media'] ?? '-',
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
                          scoreData?['ip'] ?? '-',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                child: Text(
                  Strings.allScore,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 16, right: 16),
                  itemCount: scores.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = scores[index];
                    if (data['is_final']) {
                      SkripsiSection(data: data);
                    }
                    return NilaiSection(
                      data: data,
                      onPress: (index) {},
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
