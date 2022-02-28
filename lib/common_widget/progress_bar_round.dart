import 'package:buypartsonline/Utils/size_utils/size_utils.dart';
import 'package:buypartsonline/common_widget/circular_indicator.dart';
import 'package:flutter/material.dart';

class ProgressBarRound extends StatelessWidget {
  const ProgressBarRound({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Visibility(
      visible: isLoading,
      child: Container(
        child: Indicator.screenProgressIndicator(context),
      ),
    );
  }
}
