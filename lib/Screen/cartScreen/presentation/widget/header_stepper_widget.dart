import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/step_progress_view.dart';
import 'package:flutter/material.dart';

class HeaderStepperWidget extends StatelessWidget {
  const HeaderStepperWidget({this.currentStep, Key? key}) : super(key: key);
  final int? currentStep;

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
      child: StepProgressView(
        width: SizeUtils().screenWidth,
        icons: const [
          Icons.shopping_cart_outlined,
          Icons.location_on_outlined,
          Icons.calendar_today_outlined,
          Icons.credit_card,
        ],
        curStep: currentStep,
        activeColor: colorWhite,
        inactiveColor: colorSearch,
      ),
    );
  }
}
