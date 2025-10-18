enum PiecesType { pawn, rook, knight, bishop, queen, king }

class ChessPiece {
  final PiecesType type;
  final bool isWhitePieces;
  final String imagePath;

  ChessPiece({
    required this.type,
    required this.isWhitePieces,
    required this.imagePath,
  });
}
