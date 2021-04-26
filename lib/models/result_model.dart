class ResultModel {
  double areaFloor;
  double valuePieces;
  int piecesByLength;
  int piecesByWidth;

  ResultModel(
      {this.areaFloor,
      this.valuePieces,
      this.piecesByLength,
      this.piecesByWidth}); //construtor

  int get amountPieces => piecesByWidth * piecesByLength;
  int get amountFooter => piecesByWidth + piecesByLength;
  int get amountPiecesAndFooter => amountPieces + amountFooter;
  double get areaWithoutFooter => amountPieces * areaFloor;
  double get areaWithFooter => amountPiecesAndFooter * areaFloor;
  double get amountTotalValue => amountPiecesAndFooter * valuePieces;
}
