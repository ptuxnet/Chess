// Helper function to determine if a square on a chessboard is light green or dark green
bool isLightColor(int index) {
  return (index + (index ~/ 8)) % 2 == 0;
}
