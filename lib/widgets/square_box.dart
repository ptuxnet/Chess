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
      squareBoxColor = Colors.lime.shade500;
    } else {
      squareBoxColor = isWhite ? Color(0xffE9EDCC) : Color(0xff779954);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareBoxColor,
        child: piece != null ? Image.asset(piece!.imagePath) : null,
      ),
    );
  }
}
