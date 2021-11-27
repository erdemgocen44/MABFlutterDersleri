import 'package:emulator/widget/alert_ve_textfield.dart';
import 'package:emulator/widget/basithttp.dart';
import 'package:emulator/widget/degisenwidget.dart';
import 'package:emulator/widget/dosya_konusu.dart';
import 'package:emulator/widget/formview.dart';
import 'package:emulator/widget/imageview.dart';
import 'package:emulator/widget/json_konusu.dart';
import 'package:emulator/widget/localjsonkonusu.dart';
import 'package:emulator/widget/scaffoldview.dart';
import 'package:emulator/widget/shared_konusu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/dosyakonusu": (context) => DosyaIslemleri(
              kayitIslemi: KayitIslemleri(),
            ),
        "/": (context) => ScaffoldView(),
        "/hello": (context) => DegisenWidget(),
        "/formview": (context) => FormView(),
        "/imageview": (context) => ImageView(),
        "/shared": (context) => SharedKonusu(),
        "/alert": (context) => AlertVeTextField(),
        "/jsonkonusu": (context) => JsonKonusu(),
        "/json": (context) => JsonKonusu(),
        "/localjsonkonusu": (context) => LocalJsonKonusu(),
        "/basithttp": (context) => BasitHttp(),
      },
      theme: ThemeData.light(),
    );
  }
}
