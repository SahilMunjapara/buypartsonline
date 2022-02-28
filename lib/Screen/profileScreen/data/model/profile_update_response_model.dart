class ProfileUpdateResponseModel {
  ProfileUpdateResponseModel({
    this.updateData,
    this.isSuccess,
    this.message,
  });

  List<dynamic>? updateData;
  bool? isSuccess;
  String? message;

  factory ProfileUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateResponseModel(
        updateData: List<dynamic>.from(json["Data"].map((x) => x)),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(updateData!.map((x) => x)),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}
