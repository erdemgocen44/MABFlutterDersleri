import 'package:emulator/widget/appbar_classic.dart';
import 'package:flutter/material.dart';
import "dart:convert";

class LocalJsonKonusu extends StatefulWidget {
  LocalJsonKonusu({Key? key}) : super(key: key);

  @override
  _LocalJsonKonusuState createState() => _LocalJsonKonusuState();
}

class _LocalJsonKonusuState extends State<LocalJsonKonusu> {
  late List ogrenci;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: defaultAppbar(context, "Local Json Konusu"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/data/sinif.json"),
            builder: (context, cevap) {
              ogrenci = json.decode(cevap.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Adı : " + ogrenci[index]['adi'])
                      ],
                    ),
                  );
                },
                itemCount: ogrenci == null ? 0 : ogrenci.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
