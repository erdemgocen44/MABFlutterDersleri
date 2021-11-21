import 'package:flutter/material.dart';

AppBar defaultAppbar(BuildContext context, String yazi) {
  return AppBar(
    title: Text(
      yazi,
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}
