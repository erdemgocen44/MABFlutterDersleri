import 'package:flutter/material.dart';

void main() => runApp(DegisenWidget());

class DegisenWidget extends StatefulWidget {
  const DegisenWidget({Key? key}) : super(key: key);

  @override
  State<DegisenWidget> createState() => _DegisenWidgetState();
}

class _DegisenWidgetState extends State<DegisenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ));
  }
}
