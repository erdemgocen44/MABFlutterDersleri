import 'dart:convert';

import 'package:emulator/widget/appbar_classic.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class BasitHttp extends StatefulWidget {
  BasitHttp({Key? key}) : super(key: key);

  @override
  _BasitHttpState createState() => _BasitHttpState();
}

class _BasitHttpState extends State<BasitHttp> {
  var veri = "";

  void getIslemiYap() {
    http
        .get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    )
        .then((cevap) {
      print(cevap.statusCode);
      print(cevap.body.length);
      setState(() {
        veri = cevap.body;
      });
    });

    print("Get işlemini denediniz");
  }

  void postIslemiYap() {
    http
        .post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      body: jsonEncode(veri),
    )
        .then((cevap) {
      setState(() {
        veri = cevap.body;
      });
    });
    print("Post işlemini denediniz");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, "Basit Http İşlemleri"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: postIslemiYap,
                  child: const Text("POST"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: getIslemiYap,
                  child: const Text("GET"),
                ),
              ),
            ],
          ),
          Expanded(
              child: Center(
            child: ListView(
              children: [Text('Gelen Veri : \n $veri')],
            ),
          ))
        ],
      ),
    );
  }
}
