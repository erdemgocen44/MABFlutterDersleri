import 'package:emulator/widget/appbar_classic.dart';
import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class ElFeneriView extends StatefulWidget {
  ElFeneriView({Key? key}) : super(key: key);

  @override
  _ElFeneriViewState createState() => _ElFeneriViewState();
}

class _ElFeneriViewState extends State<ElFeneriView> {
  bool _flashVarmi = false;
  bool _acikMi = false;
  double _siddeti = 1.0;
  String lamba = "kapali", btn = "Aç";

  @override
  void initState() {
    super.initState();
    ilkAcilis();
  }

  ilkAcilis() async {
    bool flashVarmi = await Lamp.hasLamp;
    setState(() {
      _flashVarmi = flashVarmi;
    });
  }

  Future _feneriAc() async {
    if (_acikMi) {
      Lamp.turnOff();
      lamba = "kapali";
      btn = "Aç";
    } else {
      Lamp.turnOn(intensity: _siddeti);
      lamba = "acik";
      btn = "Kapat";
    }
    var v = await Lamp.hasLamp;
    setState(() {
      _flashVarmi = v;
      _acikMi = !_acikMi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, "El Feneri"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/$lamba"),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () => debugPrint("Ampul açıldı"),
            child: Text("Feneri $btn"),
          ),
        ],
      ),
    );
  }
}
