import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedKonusu extends StatefulWidget {
  @override
  _SharedKonusuState createState() => _SharedKonusuState();
}

class _SharedKonusuState extends State<SharedKonusu> {
  final isimController = TextEditingController();
  final soyisimController = TextEditingController();
  final genelControl = GlobalKey<FormState>();

  String isim = "";
  String soyisim = "";
  bool kayit = false;
  int kayitNo = 0;

  void kayitYap(String isim, String soyisim) async {
    final kayitAraci = await SharedPreferences.getInstance();
    if (genelControl.currentState!.validate()) {}
  }

  void kayitGoster() {}
  void kayitSil() {}

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
            children: [
              TextFormField(
                validator: (deger) {
                  if (deger!.isEmpty) return "Lütfen isminizi yazınız";
                },
                controller: isimController,
                decoration: InputDecoration(hintText: "İsminizi Giriniz"),
              ),
              TextFormField(
                validator: (deger) {
                  if (deger!.isEmpty) return "Lütfen soyisminizi yazınız";
                },
                controller: soyisimController,
                decoration: InputDecoration(hintText: "Soyisminizi Giriniz"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Kayıt",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Getir",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Sil",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("İsim : "),
                          Text("Soyisim : "),
                          Text("Kayıt Durumu : "),
                          Text("Kayıt Numarası : ")
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
