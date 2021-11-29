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

  String isimStr = "";
  String soyisimStr = "";
  bool kayitDurumu = false;
  int kayitNo = 0;

  void kayitYap(String gIsim, String gSoyisim) async {
    final kayitAraci = await SharedPreferences.getInstance();
    if (genelControl.currentState!.validate()) {
      kayitAraci.setBool("durum", true);
      kayitAraci.setInt("kayitno", 1);
      kayitAraci.setString("isim", gIsim);
      kayitAraci.setString("soyisim", gSoyisim);

      Fluttertoast.showToast(
          msg: "Kayıt başarılı bir şekilde gerçekleşti.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  }

  void kayitGoster() async {
    final kayitAraci = await SharedPreferences.getInstance();
    bool? kDurum = kayitAraci.getBool("durum");
    int? kNo = kayitAraci.getInt("kayitNo");
    String? kIsim = kayitAraci.getString("isim");
    String? kSoyisim = kayitAraci.getString("soyisim");
    setState(() {
      kayitDurumu = kDurum!;
      kayitNo = kNo!;
      isimStr = kIsim!;
      soyisimStr = kSoyisim!;
    });

    Fluttertoast.showToast(
        msg: "Kayıt başarılı bir şekilde gösterildi.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void kayitSil() async {
    final kayitAraci = await SharedPreferences.getInstance();
    kayitAraci.remove("durum");
    kayitAraci.remove("kayitNo");

    kayitAraci.remove("isim");

    kayitAraci.remove("soyisim");

    Fluttertoast.showToast(
        msg: "Kayıt başarılı bir şekilde silindi.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

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
        title: const Text("Shared Preferences Kullanımı"),
      ),
      body: Form(
        key: genelControl,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: (deger) {
                  if (deger!.isEmpty) return "Lütfen isminizi yazınız";
                },
                controller: isimController,
                decoration: const InputDecoration(hintText: "İsminizi Giriniz"),
              ),
              TextFormField(
                validator: (deger) {
                  if (deger!.isEmpty) return "Lütfen soyisminizi yazınız";
                },
                controller: soyisimController,
                decoration:
                    const InputDecoration(hintText: "Soyisminizi Giriniz"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () => kayitYap(
                            isimController.text, soyisimController.text),
                        child: const Text(
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
                        onPressed: () {
                          kayitGoster;
                        },
                        child: const Text(
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
                        onPressed: () {
                          kayitSil();
                        },
                        child: const Text(
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
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("İsim :$isimStr "),
                          Text("Soyisim :$soyisimStr "),
                          Text("Kayıt Durumu :$kayitDurumu"),
                          Text("Kayıt Numarası :$kayitNo")
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
