class UpdatePasswordResponseModel {
  UpdatePasswordResponseModel({
    this.isSuccess,
    this.message,
    this.updatePasswordData,
  });

  bool? isSuccess;
  String? message;
  List<dynamic>? updatePasswordData;

  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordResponseModel(
        isSuccess: json["IsSuccess"],
        message: json["Message"],
        updatePasswordData: List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccess": isSuccess,
        "Message": message,
        "Data": List<dynamic>.from(updatePasswordData!.map((x) => x)),
      };
}
