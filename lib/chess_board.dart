import 'package:chess/helper/helper_function.dart';
import 'package:chess/widgets/pieces.dart';
import 'package:chess/widgets/square_box.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  // 8x8 chess board
  // Each square can be empty (null) or contain a ChessPiece
  late List<List<ChessPiece?>> board;

  // Currently selected piece and its position
  ChessPiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;

  @override
  void initState() {
    super.initState();
    initialise();
  }

  // Initialize the chess board with pieces in their starting positions
  void initialise() {
    List<List<ChessPiece?>> newBoard = List.generate(
      8,
      (index) => List.filled(8, null),
    );

    // Place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
        type: PiecesType.pawn,
        isWhitePieces: false,
        imagePath: 'assets/pawn.png',
      );
      newBoard[6][i] = ChessPiece(
        type: PiecesType.pawn,
        isWhitePieces: true,
        imagePath: 'assets/white_pawn.png',
      );
    }

    // rooks
    newBoard[0][0] = ChessPiece(
      type: PiecesType.rook,
      isWhitePieces: false,
      imagePath: 'assets/rook.png',
    );
    newBoard[0][7] = ChessPiece(
      type: PiecesType.rook,
      isWhitePieces: false,
      imagePath: 'assets/rook.png',
    );
    newBoard[7][0] = ChessPiece(
      type: PiecesType.rook,
      isWhitePieces: true,
      imagePath: 'assets/white_rook.png',
    );
    newBoard[7][7] = ChessPiece(
      type: PiecesType.rook,
      isWhitePieces: true,
      imagePath: 'assets/white_rook.png',
    );

    // knights
    newBoard[0][1] = ChessPiece(
      type: PiecesType.knight,
      isWhitePieces: false,
      imagePath: 'assets/knight.png',
    );
    newBoard[0][6] = ChessPiece(
      type: PiecesType.knight,
      isWhitePieces: false,
      imagePath: 'assets/knight.png',
    );
    newBoard[7][1] = ChessPiece(
      type: PiecesType.knight,
      isWhitePieces: true,
      imagePath: 'assets/white_knight.png',
    );
    newBoard[7][6] = ChessPiece(
      type: PiecesType.knight,
      isWhitePieces: true,
      imagePath: 'assets/white_knight.png',
    );

    // bishops
    newBoard[0][2] = ChessPiece(
      type: PiecesType.bishop,
      isWhitePieces: false,
      imagePath: 'assets/bishop.png',
    );
    newBoard[0][5] = ChessPiece(
      type: PiecesType.bishop,
      isWhitePieces: false,
      imagePath: 'assets/bishop.png',
    );
    newBoard[7][2] = ChessPiece(
      type: PiecesType.bishop,
      isWhitePieces: true,
      imagePath: 'assets/white_bishop.png',
    );
    newBoard[7][5] = ChessPiece(
      type: PiecesType.bishop,
      isWhitePieces: true,
      imagePath: 'assets/white_bishop.png',
    );

    // queens
    newBoard[0][3] = ChessPiece(
      type: PiecesType.queen,
      isWhitePieces: false,
      imagePath: 'assets/queen.png',
    );
    newBoard[7][3] = ChessPiece(
      type: PiecesType.queen,
      isWhitePieces: true,
      imagePath: 'assets/white_queen.png',
    );

    // kings
    newBoard[0][4] = ChessPiece(
      type: PiecesType.king,
      isWhitePieces: false,
      imagePath: 'assets/king.png',
    );
    newBoard[7][4] = ChessPiece(
      type: PiecesType.king,
      isWhitePieces: true,
      imagePath: 'assets/white_king.png',
    );

    board = newBoard;
  }

  void pieceSelected(int row, int col) {
    setState(() {
      if (board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        // stop the scrolling of the board
        physics: NeverScrollableScrollPhysics(),
        itemCount: 64,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;
          bool isSelected = (selectedRow == row && selectedCol == col);
          return SquareBox(
            onTap: () => pieceSelected(row, col),
            isLightColor: isLightColor(index),
            piece: board[row][col],
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
