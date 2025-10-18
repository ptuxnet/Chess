import 'package:chess/models/pieces.dart';

class ChessController {
  /// The 8x8 chess board grid.
  late List<List<ChessPiece?>> board;

  /// Selected piece and its position.
  ChessPiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;

  ChessController() {
    _initializeBoard();
  }

  /// Initializes the chess board with starting positions.
  void _initializeBoard() {
    board = List.generate(8, (_) => List.filled(8, null));

    // Pawns
    for (int i = 0; i < 8; i++) {
      board[1][i] = ChessPiece(
        type: PiecesType.pawn,
        isWhitePieces: false,
        imagePath: 'assets/pawn.png',
      );
      board[6][i] = ChessPiece(
        type: PiecesType.pawn,
        isWhitePieces: true,
        imagePath: 'assets/white_pawn.png',
      );
    }

    // Rooks
    board[0][0] = _create(PiecesType.rook, false, 'assets/rook.png');
    board[0][7] = _create(PiecesType.rook, false, 'assets/rook.png');
    board[7][0] = _create(PiecesType.rook, true, 'assets/white_rook.png');
    board[7][7] = _create(PiecesType.rook, true, 'assets/white_rook.png');

    // Knights
    board[0][1] = _create(PiecesType.knight, false, 'assets/knight.png');
    board[0][6] = _create(PiecesType.knight, false, 'assets/knight.png');
    board[7][1] = _create(PiecesType.knight, true, 'assets/white_knight.png');
    board[7][6] = _create(PiecesType.knight, true, 'assets/white_knight.png');

    // Bishops
    board[0][2] = _create(PiecesType.bishop, false, 'assets/bishop.png');
    board[0][5] = _create(PiecesType.bishop, false, 'assets/bishop.png');
    board[7][2] = _create(PiecesType.bishop, true, 'assets/white_bishop.png');
    board[7][5] = _create(PiecesType.bishop, true, 'assets/white_bishop.png');

    // Queens
    board[0][3] = _create(PiecesType.queen, false, 'assets/queen.png');
    board[7][3] = _create(PiecesType.queen, true, 'assets/white_queen.png');

    // Kings
    board[0][4] = _create(PiecesType.king, false, 'assets/king.png');
    board[7][4] = _create(PiecesType.king, true, 'assets/white_king.png');
  }

  ChessPiece _create(PiecesType type, bool isWhite, String imagePath) {
    return ChessPiece(type: type, isWhitePieces: isWhite, imagePath: imagePath);
  }

  /// Handles selecting a piece.
  void selectPiece(int row, int col) {
    if (board[row][col] != null) {
      selectedPiece = board[row][col];
      selectedRow = row;
      selectedCol = col;
    } else {
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
    }
  }
}
