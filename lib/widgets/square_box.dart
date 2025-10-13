import 'package:chess/widgets/pieces.dart';
import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  const SquareBox({super.key, required this.isWhite, required this.piece});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite ? Colors.indigo[100] : Colors.indigo[500],
      child: piece != null
          ? FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              ),
            )
          : null,
    );
  }
}
