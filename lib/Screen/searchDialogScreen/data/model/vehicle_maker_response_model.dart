class VehicleMakerResponseModel {
  VehicleMakerResponseModel({
    this.isSuccess,
    this.message,
    this.vehicleMakerData,
  });

  bool? isSuccess;
  String? message;
  List<VehicleMakerData>? vehicleMakerData;

  factory VehicleMakerResponseModel.fromJson(Map<String, dynamic> json) =>
      VehicleMakerResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        vehicleMakerData: List<VehicleMakerData>.from(
            json["Data"].map((x) => VehicleMakerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(vehicleMakerData!.map((x) => x.toJson())),
      };
}

class VehicleMakerData {
  VehicleMakerData({
    this.makersId,
    this.makersName,
    this.makersImage,
    this.makerstypeId,
    this.makersStatus,
    this.makersCdt,
    this.makerstypeName,
    this.makerstypeStatus,
    this.makerstypeCdt,
  });

  String? makersId;
  String? makersName;
  String? makersImage;
  String? makerstypeId;
  String? makersStatus;
  String? makersCdt;
  String? makerstypeName;
  String? makerstypeStatus;
  DateTime? makerstypeCdt;

  factory VehicleMakerData.fromJson(Map<String, dynamic> json) =>
      VehicleMakerData(
        makersId: json["MakersId"],
        makersName: json["MakersName"],
        makersImage: json["MakersImage"],
        makerstypeId: json["MakerstypeId"],
        makersStatus: json["MakersStatus"],
        makersCdt: json["MakersCDT"],
        makerstypeName: json["MakerstypeName"],
        makerstypeStatus: json["MakerstypeStatus"],
        makerstypeCdt: DateTime.parse(json["MakerstypeCDT"]),
      );

  Map<String, dynamic> toJson() => {
        "MakersId": makersId,
        "MakersName": makersName,
        "MakersImage": makersImage,
        "MakerstypeId": makerstypeId,
        "MakersStatus": makersStatus,
        "MakersCDT": makersCdt,
        "MakerstypeName": makerstypeName,
        "MakerstypeStatus": makerstypeStatus,
        "MakerstypeCDT": makerstypeCdt!.toIso8601String(),
      };
}
