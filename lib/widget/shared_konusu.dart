import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedKonusu extends StatefulWidget {
  @override
  _SharedKonusuState createState() => _SharedKonusuState();
}

class _SharedKonusuState extends State<SharedKonusu> {
  final isimController = TextEditingController();
  final soyisimController = TextEditingController();
  final genelControl = GlobalKey<FormState>();

  @override
  void dispose() {
    isimController.dispose();
    soyisimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences Kullanımı"),
      ),
      body: Form(
        key: genelControl,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
