import 'package:flutter/material.dart';

class AlertVeTextField extends StatefulWidget {
  @override
  _AlertVeTextFieldState createState() => _AlertVeTextFieldState();
}

class _AlertVeTextFieldState extends State<AlertVeTextField> {
  final yaziController = TextEditingController();
  final generalControl = GlobalKey<FormState>();
  @override
  void dispose() {
    yaziController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertView ve TextField Kullanımı"),
      ),
      body: Form(
        key: generalControl,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (yazi) {
                  if (yazi!.isEmpty) {
                    return "Lütfen bu kısmı boş bırakmayın";
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
