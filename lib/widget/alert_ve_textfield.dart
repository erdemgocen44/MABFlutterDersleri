import 'package:flutter/material.dart';

class AlertVeTextField extends StatefulWidget {
  const AlertVeTextField({Key? key}) : super(key: key);

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

  void selamla() {
    if (generalControl.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: const Text("Selamlama Metniniz"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Merhaba ${yaziController.text}"),
                  const Text("Sizi sistemimiz adına selamlıyorum"),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Tamam"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AlertView ve TextField Kullanımı"),
      ),
      body: Form(
        key: generalControl,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (yazi) {
                  if (yazi!.isEmpty) {
                    return "Lütfen bu kısmı boş bırakmayın";
                  }
                },
                controller: yaziController,
                decoration:
                    const InputDecoration(hintText: "Lütfen isiminizi yazınız"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: selamla,
                  child: const Text(
                    "Selamla",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
