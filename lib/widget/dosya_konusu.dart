import 'dart:async';
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class KayitIslemleri {
  //uygulamanı dosya kayıt yolunu belirledik
  Future<String> get dosyaYolu async {
    final konum = await getApplicationDocumentsDirectory();
    return konum.path;
  }

//uygulamanın dosyasını oluşturuyoruz
  Future<File> get yerelDosya async {
    final yol = await dosyaYolu;
    return File("$yol/yeniDosya.txt");
  }
//Dosya okuma işlemleri

  Future<String> dosyaOku() async {
    try {
      final dosya = await yerelDosya;
      String icerik = await dosya.readAsString();
      return icerik;
    } catch (h) {
      return "dosya okumada hata oluştu : $h";
    }
  }

  //Dosyaya yazma işlemleri
  Future<File> dosyaYaz(String gIcerik) async {
    final dosya = await yerelDosya;
    return dosya.writeAsString("$gIcerik");
  }
}

class DosyaIslemleri extends StatefulWidget {
  final KayitIslemleri kayitIslemi;
  const DosyaIslemleri({
    Key? key,
    required this.kayitIslemi,
  }) : super(key: key);
  @override
  _DosyaIslemleriState createState() => _DosyaIslemleriState();
}

class _DosyaIslemleriState extends State<DosyaIslemleri> {
  final yaziCtrl = TextEditingController();
  String veri = "";
  Future<File> veriKaydet() async {
    setState(() {
      veri = yaziCtrl.text;
    });
    return widget.kayitIslemi.dosyaYaz(veri);
  }

  @override
  void initState() {
    widget.kayitIslemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
    super.initState();
  }

  void veriOku() {
    widget.kayitIslemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dosya İşlemleri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Dosyaya eklemek istediğiniz verileri buraya ekleyiniz",
            ),
            controller: yaziCtrl,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: veriKaydet,
                    child: const Text(
                      "Kaydet",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: veriOku,
                    child: const Text(
                      "Oku",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("$veri"),
            ),
          ),
        ],
      ),
    );
  }
}
