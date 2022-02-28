class SearchByVehicleResponseModel {
  SearchByVehicleResponseModel({
    this.isSuccess,
    this.message,
    this.searchByData,
  });

  bool? isSuccess;
  String? message;
  List<SearchByData>? searchByData;

  factory SearchByVehicleResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchByVehicleResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        searchByData: List<SearchByData>.from(
            json["Data"].map((x) => SearchByData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(searchByData!.map((x) => x.toJson())),
      };
}

class SearchByData {
  SearchByData({
    this.makerstypeId,
    this.makerstypeName,
    this.makerstypeStatus,
    this.makerstypeCdt,
  });

  String? makerstypeId;
  String? makerstypeName;
  String? makerstypeStatus;
  DateTime? makerstypeCdt;

  factory SearchByData.fromJson(Map<String, dynamic> json) => SearchByData(
        makerstypeId: json["MakerstypeId"],
        makerstypeName: json["MakerstypeName"],
        makerstypeStatus: json["MakerstypeStatus"],
        makerstypeCdt: DateTime.parse(json["MakerstypeCDT"]),
      );

  Map<String, dynamic> toJson() => {
        "MakerstypeId": makerstypeId,
        "MakerstypeName": makerstypeName,
        "MakerstypeStatus": makerstypeStatus,
        "MakerstypeCDT": makerstypeCdt!.toIso8601String(),
      };
}
