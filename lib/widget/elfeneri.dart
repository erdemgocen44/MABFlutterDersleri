import 'package:emulator/widget/appbar_classic.dart';
import 'package:flutter/material.dart';

class ElFeneriView extends StatefulWidget {
  ElFeneriView({Key? key}) : super(key: key);

  @override
  _ElFeneriViewState createState() => _ElFeneriViewState();
}

class _ElFeneriViewState extends State<ElFeneriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, "El Feneri Uygulamasi"),
    );
  }
}
