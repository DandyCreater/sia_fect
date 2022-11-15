import 'package:flutter/material.dart';
import 'package:sia_fect/core/const/color_pallete.dart';
import 'package:sia_fect/core/const/strings.dart';

class NotificationPage extends StatefulWidget {
  static const String routeName = '/notification';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.notification,
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
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(
                  Icons.notifications,
                  size: 24,
                  color: Colors.grey,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(Strings.notif1),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(
                  Icons.notifications,
                  size: 24,
                  color: Colors.grey,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(Strings.notif2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
