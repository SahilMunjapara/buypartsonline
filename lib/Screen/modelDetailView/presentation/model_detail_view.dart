import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/service/network/network_string.dart';
import 'package:flutter/material.dart';

class ModelDetailView extends StatefulWidget {
  final ModelViewData modelPart;
  const ModelDetailView({required this.modelPart, Key? key}) : super(key: key);

  @override
  _ModelDetailViewState createState() => _ModelDetailViewState();
}

class _ModelDetailViewState extends State<ModelDetailView> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    double part5OffPrice = int.parse(widget.modelPart.partMrp!) -
        (int.parse(widget.modelPart.partMrp!) * 
            (int.parse(widget.modelPart.partLessMoqDiscount!) / 100));
    double part10OffPrice = int.parse(widget.modelPart.partMrp!) -
        (int.parse(widget.modelPart.partMrp!) *
            ((int.parse(widget.modelPart.partMoreMoqDiscount!)) / 100));
    return Scaffold(
      drawer: const HomeScreenDrawer(),
      backgroundColor: colorWhiteBackground,
      key: _scaffoldKey,
      body: Stack(
        children: [
          const BottomDesignBox(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: SizeUtils().hp(35),
                      width: SizeUtils().screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(SizeUtils().wp(10)),
                        ),
                        color: primaryColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(SizeUtils().wp(10)),
                        ),
                        child: Image.network(
                          imageURL + widget.modelPart.partImages!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  child: Image.asset(AssetStrings.menu),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                child: Image.asset(AssetStrings.notification),
                              ),
                            ),
                            horizontalSpace(8),
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                child: Image.asset(AssetStrings.cartAppbar),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.modelPart.partName!,
                              style: size18PNregular(textColor: primaryColor),
                            ),
                          ),
                          Container(
                            height: SizeUtils().hp(4),
                            width: SizeUtils().wp(8),
                            decoration: BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(AssetStrings.cartAdd),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: colorBrandText.withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: Text(
                            widget.modelPart.brandName!,
                            style: size09PNsemibold(
                              textColor: colorBrandText,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(10),
                      Text(
                        widget.modelPart.partName!,
                        style: size12PNregular(textColor: colorGreyPartText),
                      ),
                      verticalSpace(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.partNumber,
                            style: size12PNregular(),
                          ),
                          Text(
                            widget.modelPart.partNumber!,
                            style: size12PNregular(textColor: primaryColor),
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      horizontalDivider(
                          color: colorGreyDivider, height: 1, thickness: 1),
                      verticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.origin,
                            style: size12PNregular(),
                          ),
                          Text(
                            widget.modelPart.modificationModelNo!,
                            style: size12PNregular(textColor: primaryColor),
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      horizontalDivider(
                          color: colorGreyDivider, height: 1, thickness: 1),
                      verticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.detailsPageClass,
                            style: size12PNregular(),
                          ),
                          Text(
                            widget.modelPart.partOrigin!,
                            style: size12PNregular(textColor: primaryColor),
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      horizontalDivider(
                          color: colorGreyDivider, height: 1, thickness: 1),
                      verticalSpace(18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: SizeUtils().wp(43),
                            decoration: BoxDecoration(
                              border: Border.all(color: colorGreyDivider),
                              borderRadius: BorderRadius.circular(5),
                              color: colorWhite,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, bottom: 5),
                                  child: Text(
                                    Strings.oneToFivePieces,
                                    style: size12PNregular(),
                                  ),
                                ),
                                horizontalDivider(
                                    color: colorGreyDivider,
                                    height: 1,
                                    thickness: 1),
                                verticalSpace(12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    '₹ $part5OffPrice(${widget.modelPart.partLessMoqDiscount}% Discount)',
                                    style: size12PNregular(
                                        textColor: primaryColor),
                                  ),
                                ),
                                verticalSpace(12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    '₹ ${widget.modelPart.partMrp}',
                                    style: size10PNregular(
                                            textColor: colorGreyPartText)
                                        .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                                verticalSpace(12),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: primaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 25),
                                      child: Text(
                                        Strings.addToCart,
                                        style: size10PNregular(
                                            textColor: colorWhite),
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpace(12),
                              ],
                            ),
                          ),
                          Container(
                            width: SizeUtils().wp(43),
                            decoration: BoxDecoration(
                              border: Border.all(color: colorGreyDivider),
                              borderRadius: BorderRadius.circular(5),
                              color: colorWhite,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, bottom: 5),
                                  child: Text(
                                    Strings.fiveOrMorePieces,
                                    style: size12PNregular(),
                                  ),
                                ),
                                horizontalDivider(
                                    color: colorGreyDivider,
                                    height: 1,
                                    thickness: 1),
                                verticalSpace(12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    '₹ $part10OffPrice(${widget.modelPart.partMoreMoqDiscount}% Discount)',
                                    style: size12PNregular(
                                        textColor: primaryColor),
                                  ),
                                ),
                                verticalSpace(12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    '₹ ${widget.modelPart.partMrp}',
                                    style: size10PNregular(
                                            textColor: colorGreyPartText)
                                        .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                                verticalSpace(12),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: primaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 25),
                                      child: Text(
                                        Strings.addToCart,
                                        style: size10PNregular(
                                            textColor: colorWhite),
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpace(12),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Container(
                        decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            verticalSpace(12),
                            Row(
                              children: [
                                horizontalSpace(10),
                                Image.asset(AssetStrings.assuredReturn),
                                horizontalSpace(14),
                                Text(
                                  Strings.returnText,
                                  style: size12PNregular(),
                                ),
                              ],
                            ),
                            verticalSpace(12),
                            Row(
                              children: [
                                horizontalSpace(10),
                                Image.asset(AssetStrings.gstInvoice),
                                horizontalSpace(14),
                                Text(
                                  Strings.gstInvoice,
                                  style: size12PNregular(),
                                ),
                              ],
                            ),
                            verticalSpace(12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
