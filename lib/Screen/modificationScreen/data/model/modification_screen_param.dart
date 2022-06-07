import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_year_and_modification_response_model.dart';

class ModificationScreenParam {
  final String? modelLineId;
  final String? categoryId;
  final String? vehicleMaker;
  final String? modelLine;
  final String? year;
  final String? category;
  final List<ModelYearModificationData>? modificationData;
  final bool? isFromSearchDialog;

  ModificationScreenParam({
    this.modelLineId,
    this.categoryId,
    this.vehicleMaker,
    this.modelLine,
    this.year,
    this.category,
    this.modificationData,
    this.isFromSearchDialog,
  });
}
