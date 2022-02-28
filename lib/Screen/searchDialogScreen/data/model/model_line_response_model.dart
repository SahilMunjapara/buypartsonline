class ModelLineResponseModel {
  ModelLineResponseModel({
    this.isSuccess,
    this.message,
    this.modelLineData,
  });

  bool? isSuccess;
  String? message;
  List<ModelLineData>? modelLineData;

  factory ModelLineResponseModel.fromJson(Map<String, dynamic> json) =>
      ModelLineResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        modelLineData: List<ModelLineData>.from(
            json["Data"].map((x) => ModelLineData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(modelLineData!.map((x) => x.toJson())),
      };
}

class ModelLineData {
  ModelLineData({
    this.modelId,
    this.modelName,
    this.makersId,
    this.modelImages,
    this.modelStatus,
    this.modelCdt,
    this.makersName,
    this.makersImage,
    this.makerstypeId,
    this.makersStatus,
    this.makersCdt,
  });

  String? modelId;
  String? modelName;
  String? makersId;
  String? modelImages;
  String? modelStatus;
  String? modelCdt;
  String? makersName;
  String? makersImage;
  String? makerstypeId;
  String? makersStatus;
  String? makersCdt;

  factory ModelLineData.fromJson(Map<String, dynamic> json) => ModelLineData(
        modelId: json["ModelId"],
        modelName: json["ModelName"],
        makersId: json["MakersId"],
        modelImages: json["ModelImages"],
        modelStatus: json["ModelStatus"],
        modelCdt: json["ModelCDT"],
        makersName: json["MakersName"],
        makersImage: json["MakersImage"],
        makerstypeId: json["MakerstypeId"],
        makersStatus: json["MakersStatus"],
        makersCdt: json["MakersCDT"],
      );

  Map<String, dynamic> toJson() => {
        "ModelId": modelId,
        "ModelName": modelName,
        "MakersId": makersId,
        "ModelImages": modelImages,
        "ModelStatus": modelStatus,
        "ModelCDT": modelCdt,
        "MakersName": makersName,
        "MakersImage": makersImage,
        "MakerstypeId": makerstypeId,
        "MakersStatus": makersStatus,
        "MakersCDT": makersCdt,
      };
}
