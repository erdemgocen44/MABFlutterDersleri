import 'package:emulator/widget/scaffoldview.dart';
import 'package:flutter/material.dart';

class AnaCard extends StatelessWidget {
  final String rota;
  final String baslik;

  AnaCard(this.rota, this.baslik);
  @override
  Widget build(BuildContext context) {
    const String resimImage = "https://via.placeholder.com/600/92c952";
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, rota);
      },
      child: Card(
        child: gridViewContainer(
          baslik,
          Colors.orange,
          const NetworkImage(resimImage),
        ),
      ),
    );
  }
}
