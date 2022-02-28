class HomeBannerResponseModel {
  HomeBannerResponseModel({
    this.bannerData,
    this.isSuccess,
    this.message,
  });

  List<BannerData>? bannerData;
  bool? isSuccess;
  String? message;

  factory HomeBannerResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeBannerResponseModel(
        bannerData: List<BannerData>.from(
            json["Data"].map((x) => BannerData.fromJson(x))),
        isSuccess: json["IsSuccess"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(bannerData!.map((x) => x.toJson())),
        "IsSuccess": isSuccess,
        "Message": message,
      };
}

class BannerData {
  BannerData({
    this.banner,
    this.baseUrl,
  });

  List<Banner>? banner;
  List<BaseUrl>? baseUrl;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        banner: json["Banner"] == null
            ? null
            : List<Banner>.from(json["Banner"].map((x) => Banner.fromJson(x))),
        baseUrl: json["BaseUrl"] == null
            ? null
            : List<BaseUrl>.from(
                json["BaseUrl"].map((x) => BaseUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Banner": banner == null
            ? null
            : List<dynamic>.from(banner!.map((x) => x.toJson())),
        "BaseUrl": baseUrl == null
            ? null
            : List<dynamic>.from(baseUrl!.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.bannerId,
    this.bannerName,
    this.bannerImage,
    this.bannerStatus,
    this.bannerCdt,
  });

  String? bannerId;
  String? bannerName;
  String? bannerImage;
  String? bannerStatus;
  DateTime? bannerCdt;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        bannerId: json["BannerId"],
        bannerName: json["BannerName"],
        bannerImage: json["BannerImage"],
        bannerStatus: json["BannerStatus"],
        bannerCdt: DateTime.parse(json["BannerCDT"]),
      );

  Map<String, dynamic> toJson() => {
        "BannerId": bannerId,
        "BannerName": bannerName,
        "BannerImage": bannerImage,
        "BannerStatus": bannerStatus,
        "BannerCDT": bannerCdt!.toIso8601String(),
      };
}

class BaseUrl {
  BaseUrl({
    this.settingId,
    this.settingName,
    this.settingPincode,
    this.settingOption,
    this.settingBonusPoint,
    this.settingRedeemPoint,
    this.settingAboutUsUrl,
    this.settingStatus,
    this.settingCdt,
  });

  String? settingId;
  String? settingName;
  String? settingPincode;
  String? settingOption;
  String? settingBonusPoint;
  String? settingRedeemPoint;
  String? settingAboutUsUrl;
  String? settingStatus;
  DateTime? settingCdt;

  factory BaseUrl.fromJson(Map<String, dynamic> json) => BaseUrl(
        settingId: json["SettingId"],
        settingName: json["SettingName"],
        settingPincode: json["SettingPincode"],
        settingOption: json["SettingOption"],
        settingBonusPoint: json["SettingBonusPoint"],
        settingRedeemPoint: json["SettingRedeemPoint"],
        settingAboutUsUrl: json["SettingAboutUsURL"],
        settingStatus: json["SettingStatus"],
        settingCdt: DateTime.parse(json["SettingCDT"]),
      );

  Map<String, dynamic> toJson() => {
        "SettingId": settingId,
        "SettingName": settingName,
        "SettingPincode": settingPincode,
        "SettingOption": settingOption,
        "SettingBonusPoint": settingBonusPoint,
        "SettingRedeemPoint": settingRedeemPoint,
        "SettingAboutUsURL": settingAboutUsUrl,
        "SettingStatus": settingStatus,
        "SettingCDT": settingCdt!.toIso8601String(),
      };
}
