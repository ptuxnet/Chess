import 'package:chess/contorllers/chess_controller.dart';
import 'package:chess/views/widgets/square_box.dart';
import 'package:flutter/material.dart';
import 'package:chess/helper/helper_function.dart';

/// Displays the interactive chessboard.
/// Uses [ChessController] to handle data and game logic.
class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  final ChessController controller = ChessController();

  void _onSquareTap(int row, int col) {
    setState(() {
      controller.selectPiece(row, col);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 64,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          final row = index ~/ 8;
          final col = index % 8;
          final isSelected =
              (controller.selectedRow == row && controller.selectedCol == col);

          return SquareBox(
            onTap: () => _onSquareTap(row, col),
            isLightColor: isLightColor(index),
            piece: controller.board[row][col],
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
