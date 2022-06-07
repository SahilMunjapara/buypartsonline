import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_bloc.dart';
import 'package:buypartsonline/Global/CartCounter/Bloc/cart_counter_state.dart';
import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/widget/model_view_header.dart';
import 'package:buypartsonline/Screen/modificationScreen/data/model/modification_screen_param.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/notification_badge_widget.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widget/modification_view_card_widget.dart';

class ModificationScreen extends StatefulWidget {
  const ModificationScreen({required this.modificationScreenParam, Key? key})
      : super(key: key);
  final ModificationScreenParam modificationScreenParam;

  @override
  State<ModificationScreen> createState() => _ModificationScreenState();
}

class _ModificationScreenState extends State<ModificationScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late ModelViewScreenParam modelViewScreenParam;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    modelViewScreenParam = ModelViewScreenParam(
      categoryId: widget.modificationScreenParam.categoryId,
      category: widget.modificationScreenParam.category,
      modelLine: widget.modificationScreenParam.modelLine,
      modelLineId: widget.modificationScreenParam.modelLineId,
      vehicleMaker: widget.modificationScreenParam.vehicleMaker,
      year: widget.modificationScreenParam.year,
      isFromSearchDialog: widget.modificationScreenParam.isFromSearchDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: colorWhiteBackground,
      key: _scaffoldKey,
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.modification,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(AssetStrings.menu),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.cartScreen);
            },
            child: BlocBuilder<CartCounterBloc, CartCounterTotalState>(
              builder: (context, state) {
                return NotificationBadge(state: state);
              },
            ),
          ),
          horizontalSpace(10),
        ],
      ),
      body: Stack(
        children: [
          const BottomDesignBox(),
          Column(
            children: [
              ModelViewHeader(modelViewScreenParam: modelViewScreenParam),
              verticalSpace(25),
              widget.modificationScreenParam.modificationData!.isEmpty
                  ? const Expanded(
                      child: Center(
                      child: Text(Strings.modificationNotAvailable),
                    ))
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, right: 15, left: 15),
                          child: StaggeredGrid.count(
                            crossAxisCount: 2,
                            children: widget
                                .modificationScreenParam.modificationData!
                                .map((modificationItem) {
                              return ModificationViewCardWidget(
                                modelYearModificationData: modificationItem,
                                onCardTap: () {
                                  _onImageCardTap(context);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  void _onImageCardTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.modelViewScreen,
      arguments: ModelViewScreenParam(
        categoryId: widget.modificationScreenParam.categoryId ?? undefined,
        modelLineId: widget.modificationScreenParam.modelLineId ?? undefined,
        vehicleMaker: widget.modificationScreenParam.vehicleMaker ?? undefined,
        modelLine: widget.modificationScreenParam.modelLine ?? undefined,
        year: widget.modificationScreenParam.year ?? undefined,
        category: widget.modificationScreenParam.category ?? undefined,
        isFromSearchDialog: widget.modificationScreenParam.isFromSearchDialog,
      ),
    );
  }
}
