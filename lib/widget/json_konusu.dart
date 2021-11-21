import 'dart:async';
import 'dart:convert';

import 'package:emulator/widget/appbar_classic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as baglanti;

//fake api json kullanacağız
/*
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
*/
class Post {
  int userId;
  int id;
  String title;
  String body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  @override
  String toString() {
    return 'Post(userId: $userId, id: $id, title: $title, body: $body)';
  }
}

Future<Post> postuGetir() async {
  final cevap = await baglanti.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
  );
  if (cevap.statusCode == 200) {
    return Post.fromJson(
      json.decode(cevap.body),
    );
  } else {
    throw Exception(
        "Veriler getirilirken hata olultu Hata kodu : ${cevap.statusCode}");
  }
}

class JsonKonusu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, "Basit Json Konusu"),
      body: Center(
        child: FutureBuilder<Post>(
          future: postuGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int userId = snapshot.data!.userId;
              int id = snapshot.data!.id;
              String title = snapshot.data!.title;
              String body = snapshot.data!.body;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  jsonTextBody("gelen userId : $userId"),
                  jsonTextBody("gelen id : $id"),
                  jsonTextBody("gelen title : $title"),
                  jsonTextBody("gelen body : $body"),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Hata Oluştu : ${snapshot.error}");
            }
            return const CircularProgressIndicator(
              color: Colors.pinkAccent,
            );
          },
        ),
      ),
    );
  }

  Padding jsonTextBody(String yazi) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(yazi),
    );
  }
}
