import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/modelViewScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_response_model.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/widget/model_view_card_widget.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/widget/model_view_header.dart';
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
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ModelViewScreen extends StatefulWidget {
  final ModelViewScreenParam modelViewScreenParam;
  const ModelViewScreen({required this.modelViewScreenParam, Key? key})
      : super(key: key);

  @override
  _ModelViewScreenState createState() => _ModelViewScreenState();
}

class _ModelViewScreenState extends State<ModelViewScreen> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late RefreshController _refreshController;
  ModelViewBloc modelViewBloc = ModelViewBloc();
  int pageNo = 1;
  bool isLoading = false;
  bool isAddCartLoading = false;
  List<ModelViewData> modelPartList = [];
  int partListLength = 0;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _refreshController = RefreshController(initialRefresh: false);
    modelViewBloc.add(ModelViewDetailFetchEvent(
      categoryId: widget.modelViewScreenParam.categoryId,
      customerId: AppPreference().getStringData(PreferencesKey.userId),
      modelLineId: widget.modelViewScreenParam.modelLineId,
      pageNo: pageNo.toString(),
    ));
    super.initState();
  }

  void _onLoading() async {
    if (partListLength == modelPartList.length ||
        partListLength < modelPartList.length) {
      _refreshController.loadNoData();
    } else {
      if (mounted) {
        modelViewBloc.add(ModelViewDetailFetchEvent(
          categoryId: widget.modelViewScreenParam.categoryId,
          customerId: AppPreference().getStringData(PreferencesKey.userId),
          modelLineId: widget.modelViewScreenParam.modelLineId,
          pageNo: (++pageNo).toString(),
        ));
      }
      await Future.delayed(const Duration(milliseconds: 3000));
      _refreshController.loadComplete();
    }
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.cartScreen);
            },
            child: Image.asset(AssetStrings.cartAppbar),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.notificationScreen);
            },
            child: Image.asset(AssetStrings.notification),
          ),
        ],
      ),
      body: BlocListener(
        bloc: modelViewBloc,
        listener: (context, state) {
          if (state is ModelViewIsLoadingBeginState) {
            if (pageNo == 1) {
              isLoading = true;
            }
          }
          if (state is ModelViewIsLoadingEndState) {
            isLoading = false;
          }
          if (state is CartAddIsLoadingBeginState) {
            isAddCartLoading = true;
          }
          if (state is CartAddIsLoadingEndState) {
            isAddCartLoading = false;
          }
          if (state is ModelViewLoadedState) {
            if (pageNo == 1) {
              modelPartList = state.responseModel.modelViewData!;
              partListLength = int.parse(state.responseModel.totalLength!);
            } else {
              state.responseModel.modelViewData!
                  .map((e) => modelPartList.add(e))
                  .toList();
            }
          }
          if (state is ModelViewCartAddedState) {
            modelPartList.map((e) {
              if (e.partId == state.responseModel.cartAddData!.first.partId) {
                e.isCart = true;
              }
            }).toList();
            ShowToast.toastMsg(state.responseModel.message!);
          }
          if (state is ModelViewErrorState) {
            AppException exception = state.exception;
            ShowToast.toastMsg(exception.message);
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
                    ModelViewHeader(
                      modelViewScreenParam: widget.modelViewScreenParam,
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
                                child: SmartRefresher(
                                  controller: _refreshController,
                                  enablePullDown: false,
                                  enablePullUp: true,
                                  onLoading: _onLoading,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 30, right: 15, left: 15),
                                      child: StaggeredGrid.count(
                                        crossAxisCount: 2,
                                        children:
                                            modelPartList.map((modelPartItem) {
                                          return ModelViewCard(
                                            modelViewData: modelPartItem,
                                            onOneCartAdd: () {
                                              if (modelPartItem.isCart!) {
                                                ShowToast.toastMsg(
                                                  ToastString
                                                      .alreadyAddedInCart,
                                                );
                                              } else {
                                                if (!isAddCartLoading) {
                                                  modelViewBloc.add(
                                                    ModelViewAddCartEvent(
                                                      cartQuantity:
                                                          1.toString(),
                                                      customerId:
                                                          AppPreference()
                                                              .getStringData(
                                                                  PreferencesKey
                                                                      .userId),
                                                      partId:
                                                          modelPartItem.partId,
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            onFiveCartAdd: () {
                                              if (modelPartItem.isCart!) {
                                                ShowToast.toastMsg(ToastString
                                                    .alreadyAddedInCart);
                                              } else {
                                                if (!isAddCartLoading) {
                                                  modelViewBloc.add(
                                                    ModelViewAddCartEvent(
                                                      cartQuantity:
                                                          5.toString(),
                                                      customerId:
                                                          AppPreference()
                                                              .getStringData(
                                                                  PreferencesKey
                                                                      .userId),
                                                      partId:
                                                          modelPartItem.partId,
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                  ],
                ),
                Visibility(
                  visible: isAddCartLoading,
                  child: SizedBox(
                    height: SizeUtils().screenHeight,
                    width: SizeUtils().screenWidth,
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
