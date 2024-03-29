import 'package:buypartsonline/Navigation/routes_key.dart';
import 'package:buypartsonline/Screen/modelViewScreen/data/model/model_view_screen_param.dart';
import 'package:buypartsonline/Screen/modelViewScreen/presentation/model_view_screen.dart';
import 'package:buypartsonline/Screen/modificationScreen/data/model/modification_screen_param.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/bloc/bloc.dart';
import 'package:buypartsonline/Screen/searchDialogScreen/data/model/model_year_and_modification_response_model.dart';
import 'package:buypartsonline/UI_Helper/colors.dart';
import 'package:buypartsonline/UI_Helper/string.dart';
import 'package:buypartsonline/UI_Helper/text_style.dart';
import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/space_widget.dart';
import 'package:buypartsonline/common_widget/toast_msg.dart';
import 'package:buypartsonline/service/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDialogBox extends StatefulWidget {
  const SearchDialogBox({Key? key}) : super(key: key);

  @override
  _SearchDialogBoxState createState() => _SearchDialogBoxState();
}

class SearchData {
  String? name;
  String? id;

  SearchData({this.id, this.name});
}

class _SearchDialogBoxState extends State<SearchDialogBox> {
  SearchDialogBloc searchDialogBloc = SearchDialogBloc();
  String? _searchByvalue;
  String? searchById;
  String? _vehicleMakerValue;
  String? vehicleMakerId;
  String? _modelLineValue;
  String? modelLineId;
  String? _yearValue;
  String? yearId;
  String? _modificationValue;
  String? _categoryValue;
  String? categoryId;
  List<SearchData>? searchByList = <SearchData>[];
  List<SearchData>? vehicleMakerList = <SearchData>[];
  List<SearchData>? modelLineList = <SearchData>[];
  List<SearchData>? yearList = <SearchData>[];
  List<SearchData>? modificationList = <SearchData>[];
  List<SearchData>? categoryList = <SearchData>[];
  List<ModelYearModificationData> modelModificationList =
      <ModelYearModificationData>[];
  bool? isLoading = false;

  @override
  void initState() {
    searchDialogBloc.add(SearchByVehicleEvent());
    modelPartList.clear();
    modelPartList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: searchDialogBloc,
      listener: (context, state) {
        if (state is SearchDataIsLoadingState) {
          isLoading = true;
        }
        if (state is SearchDataIsLoadingEndState) {
          isLoading = false;
        }
        if (state is SearchByVehicleState) {
          state.responseModel.searchByData!
              .map((searchVehicle) => searchByList!.add(SearchData(
                    id: searchVehicle.makerstypeId!,
                    name: searchVehicle.makerstypeName!,
                  )))
              .toList();
        }
        if (state is VehicleMakerState) {
          state.responseModel.vehicleMakerData!
              .map((vehicleMaker) => vehicleMakerList!.add(SearchData(
                    id: vehicleMaker.makersId!,
                    name: vehicleMaker.makersName!,
                  )))
              .toList();
        }
        if (state is ModelLineState) {
          state.responseModel.modelLineData!
              .map((modelLine) => modelLineList!.add(SearchData(
                    id: modelLine.modelId!,
                    name: modelLine.modelName!,
                  )))
              .toList();
        }
        if (state is ModelModificationState) {
          state.responseModel.modelYearModificationData!.map((e) {
            modificationList!.add(
              SearchData(id: e.modificationId, name: e.modificationName),
            );
          }).toList();
          modelModificationList =
              state.responseModel.modelYearModificationData!;
        }
        if (state is ModelYearState) {
          state.responseModel.modelYearModificationData!.map((e) {
            yearList!.add(
              SearchData(
                id: e.modelId,
                name: '${e.modificationStartYear}-${e.modificationEndYear}',
              ),
            );
          }).toList();
        }
        if (state is ModelCategoryState) {
          state.responseModel.modelCategoryData!.map((e) {
            categoryList!
                .add(SearchData(id: e.categoryId, name: e.categoryName));
          }).toList();
        }
        if (state is SearchDialogErrorState) {
          AppException exception = state.exception;
          ShowToast.toastMsg(exception.message);
        }
      },
      child: BlocBuilder(
        bloc: searchDialogBloc,
        builder: (context, state) {
          return Dialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Column(children: [
                      Container(
                        height: SizeUtils().hp(7),
                        width: SizeUtils().screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                Strings.searchByvehicle,
                                textAlign: TextAlign.center,
                                style: size18PNregular(textColor: colorWhite),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 7,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: SizeUtils().hp(5),
                                  width: SizeUtils().wp(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: colorWhite,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: colorWhite,
                                    textDirection: TextDirection.rtl,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(13),
                      SizedBox(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            customDropdownForm(
                              hintText: Strings.searchByvehicle,
                              list: searchByList,
                              listValue: _searchByvalue,
                              onChange: (searchByValue) {
                                vehicleMakerList!.clear();
                                _vehicleMakerValue = null;
                                modelLineList!.clear();
                                _modelLineValue = null;
                                yearList!.clear();
                                _yearValue = null;
                                modificationList!.clear();
                                _modificationValue = null;
                                categoryList!.clear();
                                _categoryValue = null;
                                setState(() {
                                  searchByList!.map((searchBy) {
                                    if (searchBy.name == searchByValue) {
                                      searchById = searchBy.id;
                                    }
                                  }).toList();
                                  _searchByvalue = searchByValue;
                                });
                                searchDialogBloc.add(
                                    VehicleMakerEvent(makerId: searchById!));
                              },
                            ),
                            verticalSpace(22),
                            customDropdownForm(
                              hintText: Strings.vehicleMaker,
                              list: vehicleMakerList,
                              listValue: _vehicleMakerValue,
                              onChange: (vehiclemakerValue) {
                                setState(() {
                                  modelLineList!.clear();
                                  _modelLineValue = null;
                                  yearList!.clear();
                                  _yearValue = null;
                                  modificationList!.clear();
                                  _modificationValue = null;
                                  categoryList!.clear();
                                  _categoryValue = null;
                                  vehicleMakerList!.map((vehicleMaker) {
                                    if (vehicleMaker.name ==
                                        vehiclemakerValue) {
                                      vehicleMakerId = vehicleMaker.id;
                                    }
                                  }).toList();
                                  _vehicleMakerValue = vehiclemakerValue;
                                });
                                searchDialogBloc.add(
                                    ModelLineEvent(modelId: vehicleMakerId!));
                              },
                            ),
                            verticalSpace(22),
                            customDropdownForm(
                              hintText: Strings.modelLine,
                              list: modelLineList,
                              listValue: _modelLineValue,
                              onChange: (modelLineValue) {
                                setState(() {
                                  yearList!.clear();
                                  _yearValue = null;
                                  modificationList!.clear();
                                  _modificationValue = null;
                                  categoryList!.clear();
                                  _categoryValue = null;
                                  modelLineList!.map((modelLine) {
                                    if (modelLine.name == modelLineValue) {
                                      modelLineId = modelLine.id;
                                    }
                                  }).toList();
                                  _modelLineValue = modelLineValue;
                                });
                                searchDialogBloc.add(
                                    ModelYearEvent(modelLineId: modelLineId!));
                                searchDialogBloc.add(ModelModificationEvent(
                                    modelLineId: modelLineId!));
                                searchDialogBloc.add(ModelCategoryEvent(
                                    modelLineName: _modelLineValue!));
                              },
                            ),
                            verticalSpace(22),
                            customDropdownForm(
                              hintText: Strings.year,
                              list: yearList,
                              listValue: _yearValue,
                              onChange: (yearValue) {
                                setState(() {
                                  _yearValue = yearValue;
                                });
                              },
                            ),
                            verticalSpace(22),
                            customDropdownForm(
                              hintText: Strings.modification,
                              list: modificationList,
                              listValue: _modificationValue,
                              onChange: (modificationValue) {
                                setState(() {
                                  _modificationValue = modificationValue;
                                });
                              },
                            ),
                            verticalSpace(22),
                            customDropdownForm(
                              hintText: Strings.selectCategory,
                              list: categoryList,
                              listValue: _categoryValue,
                              onChange: (categoryValue) {
                                setState(() {
                                  categoryList!.map((category) {
                                    if (category.name == categoryValue) {
                                      categoryId = category.id;
                                    }
                                  }).toList();
                                  _categoryValue = categoryValue;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                      verticalSpace(15),
                      GestureDetector(
                        onTap: isLoading!
                            ? null
                            : () {
                                if (_searchByvalue == null ||
                                    _vehicleMakerValue == null ||
                                    _modelLineValue == null) {
                                  ShowToast.toastMsg(
                                      ToastString.requiredFieldSearchByVehicle);
                                } else {
                                  Navigator.pop(context);
                                  if (_modificationValue == null) {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.modificationScreen,
                                      arguments: ModificationScreenParam(
                                        categoryId: categoryId ?? undefined,
                                        modelLineId: modelLineId ?? undefined,
                                        vehicleMaker:
                                            _vehicleMakerValue ?? undefined,
                                        modelLine: _modelLineValue ?? undefined,
                                        year: _yearValue ?? undefined,
                                        category: _categoryValue ?? undefined,
                                        modificationData: modelModificationList,
                                        isFromSearchDialog: true,
                                      ),
                                    );
                                  } else {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.modelViewScreen,
                                      arguments: ModelViewScreenParam(
                                        categoryId: categoryId ?? undefined,
                                        modelLineId: modelLineId ?? undefined,
                                        vehicleMaker:
                                            _vehicleMakerValue ?? undefined,
                                        modelLine: _modelLineValue ?? undefined,
                                        year: _yearValue ?? undefined,
                                        category: _categoryValue ?? undefined,
                                        isFromSearchDialog: true,
                                      ),
                                    );
                                  }
                                }
                              },
                        child: Container(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          height: SizeUtils().hp(7),
                          width: SizeUtils().wp(80),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              Strings.searchParts,
                              style: size16PNregular(textColor: colorWhite),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(15),
                    ]),
                    Visibility(
                      visible: isLoading!,
                      child: SizedBox(
                        height: SizeUtils().hp(75),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget customDropdownForm({
    String? hintText,
    String? listValue,
    Function(String?)? onChange,
    List<SearchData>? list,
  }) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              height: SizeUtils().hp(6.5),
              width: SizeUtils().wp(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorWhiteBackground,
              ),
            ),
            SizedBox(
              width: SizeUtils().wp(2),
            ),
            Container(
              height: SizeUtils().hp(6.5),
              width: SizeUtils().wp(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorWhiteBackground,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 14),
          width: SizeUtils().wp(82),
          child: DropdownButton<String>(
              value: listValue,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colorDropdownText,
              ),
              isExpanded: true,
              underline: const SizedBox(),
              items: list!.map((items) {
                return DropdownMenuItem(
                  value: items.name,
                  child: Text(items.name!),
                );
              }).toList(),
              onChanged: onChange,
              hint: Text(
                hintText!,
                style: size14PNregular(textColor: colorDropdownText),
              )),
        ),
      ],
    );
  }
}
