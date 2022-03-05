import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:flutter/material.dart';

class ModelViewHeader extends StatelessWidget {
  const ModelViewHeader({this.modelViewScreenParam, Key? key})
      : super(key: key);
  final ModelViewScreenParam? modelViewScreenParam;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeUtils().wp(10)),
        ),
      ),
      height: SizeUtils().hp(12),
      width: SizeUtils().screenWidth,
      child: modelViewScreenParam!.isFromSearchDialog!
          ? Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 20,
                  children: [
                    Visibility(
                      visible: modelViewScreenParam!.vehicleMaker! != undefined,
                      child: Chip(
                        backgroundColor: colorSearch,
                        labelStyle: size12PNsemibold(
                            textColor: colorWhite, letterSpacing: 0.5),
                        label: Text(modelViewScreenParam!.vehicleMaker!),
                      ),
                    ),
                    Visibility(
                      visible: modelViewScreenParam!.modelLine! != undefined,
                      child: Chip(
                        backgroundColor: colorSearch,
                        labelStyle: size12PNsemibold(
                            textColor: colorWhite, letterSpacing: 0.5),
                        label: Text(modelViewScreenParam!.modelLine!),
                      ),
                    ),
                    Visibility(
                      visible: modelViewScreenParam!.year! != undefined,
                      child: Chip(
                        backgroundColor: colorSearch,
                        labelStyle: size12PNsemibold(
                            textColor: colorWhite, letterSpacing: 0.5),
                        label: Text(modelViewScreenParam!.year!),
                      ),
                    ),
                    Visibility(
                      visible: modelViewScreenParam!.category! != undefined,
                      child: Chip(
                        backgroundColor: colorSearch,
                        labelStyle: size12PNsemibold(
                            textColor: colorWhite, letterSpacing: 0.5),
                        label: Text(modelViewScreenParam!.category!),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  backgroundColor: colorSearch,
                  labelStyle: size12PNsemibold(
                      textColor: colorWhite, letterSpacing: 0.5),
                  label: Text(modelViewScreenParam!.category!),
                ),
              ),
            ),
    );
  }
}
