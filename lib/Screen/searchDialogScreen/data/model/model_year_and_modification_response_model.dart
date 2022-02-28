class ModelYearAndModificationResponseModel {
  ModelYearAndModificationResponseModel({
    this.isSuccess,
    this.message,
    this.modelYearModificationData,
  });

  bool? isSuccess;
  String? message;
  List<ModelYearModificationData>? modelYearModificationData;

  factory ModelYearAndModificationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ModelYearAndModificationResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        modelYearModificationData: List<ModelYearModificationData>.from(
            json["Data"].map((x) => ModelYearModificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(
            modelYearModificationData!.map((x) => x.toJson())),
      };
}

class ModelYearModificationData {
  ModelYearModificationData({
    this.modificationId,
    this.makersId,
    this.modelId,
    this.modificationName,
    this.modificationModelNo,
    this.modificationImage,
    this.modificationStartYear,
    this.modificationEndYear,
    this.modificationEngineType,
    this.modificationEngineCodes,
    this.modificationEngineLiters,
    this.modificationEnginePower,
    this.modificationBrakeType,
    this.modificationBrakeSystem,
    this.modificationMotorPower,
    this.modificationVolumeCcm,
    this.modificationTank,
    this.modificationAbs,
    this.modificationTechnicalCcm,
    this.modificationTranmissionType,
    this.modificationStatus,
    this.modificationCdt,
    this.makersName,
    this.makersImage,
    this.makerstypeId,
    this.makersStatus,
    this.makersCdt,
    this.modelName,
    this.modelImages,
    this.modelStatus,
    this.modelCdt,
  });

  String? modificationId;
  String? makersId;
  String? modelId;
  String? modificationName;
  String? modificationModelNo;
  String? modificationImage;
  String? modificationStartYear;
  String? modificationEndYear;
  String? modificationEngineType;
  String? modificationEngineCodes;
  String? modificationEngineLiters;
  String? modificationEnginePower;
  String? modificationBrakeType;
  String? modificationBrakeSystem;
  String? modificationMotorPower;
  String? modificationVolumeCcm;
  String? modificationTank;
  String? modificationAbs;
  String? modificationTechnicalCcm;
  String? modificationTranmissionType;
  String? modificationStatus;
  String? modificationCdt;
  String? makersName;
  String? makersImage;
  String? makerstypeId;
  String? makersStatus;
  String? makersCdt;
  String? modelName;
  String? modelImages;
  String? modelStatus;
  String? modelCdt;

  factory ModelYearModificationData.fromJson(Map<String, dynamic> json) =>
      ModelYearModificationData(
        modificationId: json["ModificationId"],
        makersId: json["MakersId"],
        modelId: json["ModelId"],
        modificationName: json["ModificationName"],
        modificationModelNo: json["ModificationModelNo"],
        modificationImage: json["ModificationImage"],
        modificationStartYear: json["ModificationStartYear"],
        modificationEndYear: json["ModificationEndYear"],
        modificationEngineType: json["ModificationEngineType"],
        modificationEngineCodes: json["ModificationEngineCodes"],
        modificationEngineLiters: json["ModificationEngineLiters"],
        modificationEnginePower: json["ModificationEnginePower"],
        modificationBrakeType: json["ModificationBrakeType"],
        modificationBrakeSystem: json["ModificationBrakeSystem"],
        modificationMotorPower: json["ModificationMotorPower"],
        modificationVolumeCcm: json["ModificationVolumeCCM"],
        modificationTank: json["ModificationTank"],
        modificationAbs: json["ModificationABS"],
        modificationTechnicalCcm: json["ModificationTechnicalCCM"],
        modificationTranmissionType: json["ModificationTranmissionType"],
        modificationStatus: json["ModificationStatus"],
        modificationCdt: json["ModificationCDT"],
        makersName: json["MakersName"],
        makersImage: json["MakersImage"],
        makerstypeId: json["MakerstypeId"],
        makersStatus: json["MakersStatus"],
        makersCdt: json["MakersCDT"],
        modelName: json["ModelName"],
        modelImages: json["ModelImages"],
        modelStatus: json["ModelStatus"],
        modelCdt: json["ModelCDT"],
      );

  Map<String, dynamic> toJson() => {
        "ModificationId": modificationId,
        "MakersId": makersId,
        "ModelId": modelId,
        "ModificationName": modificationName,
        "ModificationModelNo": modificationModelNo,
        "ModificationImage": modificationImage,
        "ModificationStartYear": modificationStartYear,
        "ModificationEndYear": modificationEndYear,
        "ModificationEngineType": modificationEngineType,
        "ModificationEngineCodes": modificationEngineCodes,
        "ModificationEngineLiters": modificationEngineLiters,
        "ModificationEnginePower": modificationEnginePower,
        "ModificationBrakeType": modificationBrakeType,
        "ModificationBrakeSystem": modificationBrakeSystem,
        "ModificationMotorPower": modificationMotorPower,
        "ModificationVolumeCCM": modificationVolumeCcm,
        "ModificationTank": modificationTank,
        "ModificationABS": modificationAbs,
        "ModificationTechnicalCCM": modificationTechnicalCcm,
        "ModificationTranmissionType": modificationTranmissionType,
        "ModificationStatus": modificationStatus,
        "ModificationCDT": modificationCdt,
        "MakersName": makersName,
        "MakersImage": makersImage,
        "MakerstypeId": makerstypeId,
        "MakersStatus": makersStatus,
        "MakersCDT": makersCdt,
        "ModelName": modelName,
        "ModelImages": modelImages,
        "ModelStatus": modelStatus,
        "ModelCDT": modelCdt,
      };
}
