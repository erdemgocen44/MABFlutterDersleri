import 'package:flutter/material.dart';

void main() => runApp(DegisenWidget());

class DegisenWidget extends StatefulWidget {
  @override
  State<DegisenWidget> createState() => _DegisenWidgetState();
}

class _DegisenWidgetState extends State<DegisenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ));
  }
}
