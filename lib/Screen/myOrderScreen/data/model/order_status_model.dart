import 'package:buypartsonline/UI_Helper/string.dart';

class OrderStatusModel {
  int? id;
  String? statusName;
  bool? isSelected;

  OrderStatusModel({this.id, this.statusName, this.isSelected});
}

List<OrderStatusModel> orderStatusList = [
  OrderStatusModel(id: 1, statusName: Strings.inProgress, isSelected: true),
  OrderStatusModel(id: 2, statusName: Strings.completed, isSelected: false),
  OrderStatusModel(id: 3, statusName: Strings.returned, isSelected: false),
  OrderStatusModel(id: 4, statusName: Strings.cancelled, isSelected: false),
];
