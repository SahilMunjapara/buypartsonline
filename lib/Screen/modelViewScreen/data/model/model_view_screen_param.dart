class ModelViewScreenParam {
  final String? modelLineId;
  final String? categoryId;
  final String? vehicleMaker;
  final String? modelLine;
  final String? year;
  final String? category;
  final bool? isFromSearchDialog;

  ModelViewScreenParam(
      {this.modelLineId,
      this.categoryId,
      this.vehicleMaker,
      this.modelLine,
      this.year,
      this.category,
      this.isFromSearchDialog});
}
