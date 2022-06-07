import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_year_and_modification_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class ModificationViewCardWidget extends StatelessWidget {
  const ModificationViewCardWidget(
      {this.modelYearModificationData, this.onCardTap, Key? key})
      : super(key: key);
  final ModelYearModificationData? modelYearModificationData;
  final VoidCallback? onCardTap;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return GestureDetector(
      onTap: onCardTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: SizeUtils().screenWidth,
                height: SizeUtils().hp(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorWhiteBackground,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: modelYearModificationData!.modelImages == "" ||
                          modelYearModificationData!.modelImages ==
                              Strings.noImage
                      ? Image.asset(AssetStrings.noImage)
                      : Image.network(
                          imageURL + modelYearModificationData!.modelImages!,
                          fit: BoxFit.fill,
                          errorBuilder: (context, object, stackTrace) {
                            return Image.asset(
                              AssetStrings.noImage,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                ),
              ),
              verticalSpace(6),
              SizedBox(
                height: SizeUtils().hp(5),
                child: Center(
                  child: Text(
                    modelYearModificationData!.modificationName!,
                    textAlign: TextAlign.justify,
                    style: size10PNregular(),
                  ),
                ),
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              Text(
                '${modelYearModificationData!.modificationStartYear!}-${modelYearModificationData!.modificationEndYear!}',
                style: size10PNregular(
                  textColor: colorBrandText,
                ),
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              _modificationDetailsText(
                Strings.engineType,
                modelYearModificationData!.modificationEngineType!,
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              _modificationDetailsText(
                Strings.powerHp,
                modelYearModificationData!.modificationEnginePower!,
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              _modificationDetailsText(
                Strings.powerKw,
                modelYearModificationData!.modificationEngineLiters!,
              ),
              verticalSpace(SizeUtils().hp(0.5)),
              _modificationDetailsText(
                Strings.engineCode,
                modelYearModificationData!.modificationEngineCodes!,
              ),
              verticalSpace(SizeUtils().hp(0.7)),
              GestureDetector(
                onTap: onCardTap,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          Strings.choose,
                          style: size11PNregular(textColor: colorWhite),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(SizeUtils().hp(0.2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _modificationDetailsText(String? title, String? detail) {
    return Row(
      children: [
        Text(
          title!,
          style: size10PNsemibold(textColor: primaryColor),
        ),
        Text(
          detail!,
          style: size10PNregular(textColor: colorGreyPartText),
        ),
      ],
    );
  }
}
