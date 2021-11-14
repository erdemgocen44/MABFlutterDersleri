import 'dart:async';
import 'dart:io';

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
  DosyaIslemleri({
    Key? key,
    required this.kayitIslemi,
  }) : super(key: key);

  @override
  _DosyaIslemleriState createState() => _DosyaIslemleriState();
}

class _DosyaIslemleriState extends State<DosyaIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: ,),);
  }
}
