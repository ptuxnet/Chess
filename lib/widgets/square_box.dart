import 'package:chess/widgets/pieces.dart';
import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final bool isWhite;
  final bool isSelected;
  final ChessPiece? piece;
  final void Function()? onTap;

  const SquareBox({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareBoxColor;

    if (isSelected) {
      squareBoxColor = Colors.green[400];
    } else {
      squareBoxColor = isWhite ? Colors.indigo[100] : Colors.indigo[500];
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareBoxColor,
        child: piece != null
            ? FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  piece!.imagePath,
                  color: piece!.isWhite ? Colors.white : Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
