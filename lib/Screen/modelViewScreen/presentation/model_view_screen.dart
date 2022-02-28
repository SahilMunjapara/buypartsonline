import 'package:buypartsonline/Screen/modelViewScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/widget/model_view_card_widget.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/images.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/app_preferences/app_preferences.dart';
import 'package:buypartsonline/Utils/app_preferences/prefrences_key.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/bottom_design.dart';
import 'package:buypartsonline/common_widget/home_screen_drawer.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelViewScreen extends StatefulWidget {
  final ModelViewScreenParam modelViewScreenParam;
  const ModelViewScreen({required this.modelViewScreenParam, Key? key})
      : super(key: key);

  @override
  _ModelViewScreenState createState() => _ModelViewScreenState();
}

class _ModelViewScreenState extends State<ModelViewScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  ModelViewBloc modelViewBloc = ModelViewBloc();
  int pageNo = 1;
  bool isLoading = false;
  List<ModelViewData> modelPartList = [];

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    modelViewBloc.add(ModelViewDetailFetchEvent(
      categoryId: widget.modelViewScreenParam.categoryId,
      customerId: AppPreference().getStringData(PreferencesKey.userId),
      modelLineId: widget.modelViewScreenParam.modelLineId,
      pageNo: pageNo.toString(),
    ));
    super.initState();
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
          Strings.model,
          style: size23PNregular(textColor: colorWhite),
        ),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(AssetStrings.menu),
        ),
        actions: [
          GestureDetector(child: Image.asset(AssetStrings.cartAppbar)),
          GestureDetector(child: Image.asset(AssetStrings.notification)),
        ],
      ),
      body: BlocListener(
        bloc: modelViewBloc,
        listener: (context, state) {
          if (state is ModelViewIsLoadingBeginState) {
            isLoading = true;
          }
          if (state is ModelViewIsLoadingEndState) {
            isLoading = false;
          }
          if (state is ModelViewLoadedState) {
            modelPartList = state.responseModel.modelViewData!;
          }
        },
        child: BlocBuilder(
          bloc: modelViewBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const BottomDesignBox(),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(SizeUtils().wp(10)),
                        ),
                      ),
                      height: SizeUtils().hp(12),
                      width: SizeUtils().screenWidth,
                    ),
                    verticalSpace(25),
                    isLoading
                        ? const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(primaryColor),
                              ),
                            ),
                          )
                        : modelPartList.isEmpty
                            ? const Expanded(
                                child: Center(
                                child: Text(Strings.noPartsAvailable),
                              ))
                            : Expanded(
                                child: GridView.builder(
                                  padding: const EdgeInsets.only(
                                      bottom: 30, right: 15, left: 15),
                                  itemCount: modelPartList.length,
                                  itemBuilder: (context, index) {
                                    return ModelViewCard(
                                      modelViewData: modelPartList[index],
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.68,
                                  ),
                                ),
                              ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
