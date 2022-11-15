import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sia_fect/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const MyApp());
}
