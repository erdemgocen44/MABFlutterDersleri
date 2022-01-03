import 'package:flutter/material.dart';

class BilgilendirmeSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: YaziHareket(),
      ),
    );
  }
}

class YaziHareket extends StatefulWidget {
  const YaziHareket({Key? key}) : super(key: key);

  @override
  _YaziHareketState createState() => _YaziHareketState();
}

class _YaziHareketState extends State<YaziHareket>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        debugPrint(status.toString());
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Bilgilendirme Sayfası",
        style: TextStyle(fontSize: 14 + _animation.value * 5),
      ),
    );
  }
}
