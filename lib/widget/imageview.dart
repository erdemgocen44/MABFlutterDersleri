import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageView Kullanımı"),
      ),
      body: ListView(
        children: [
          const Text(
            "İnternetteki resmi placeHolder ile kullanma",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.gif",
            image: "https://picsum.photos/400",
          ),
          const Text(
            "Assets klasöru içindeki resmi kullanma",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            "assets/images/lake.jpg",
            fit: BoxFit.cover,
          ),
          const Text(
            "İnternetteki resmi kullanma",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Image.network(
            "https://picsum.photos/300",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
