import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final String message;

  PlaceholderWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}