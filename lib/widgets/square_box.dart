import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final bool isGreen;
  const SquareBox({super.key, required this.isGreen});

  @override
  Widget build(BuildContext context) {
    return Container(color: isGreen ? Colors.green.shade50 : Colors.green);
  }
}
