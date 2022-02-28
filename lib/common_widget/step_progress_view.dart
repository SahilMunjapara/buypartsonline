import 'package:flutter/material.dart';

class StepProgressView extends StatelessWidget {
  final double? width;
  final List<IconData>? icons;
  final List<String>? titles;
  final int? curStep;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? lineWidth = 4.0;

  const StepProgressView(
      {Key? key,
      this.width,
      this.icons,
      this.titles,
      this.curStep,
      this.activeColor,
      this.inactiveColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 32.0,
          left: 24.0,
          right: 24.0,
        ),
        width: width!,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            const SizedBox(
              height: 10,
            ),
            if (titles != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _titleViews(),
              ),
          ],
        ));
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    titles!.asMap().forEach((i, text) {
      list.add(Text(text, style: TextStyle(color: activeColor)));
    });
    return list;
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    icons!.asMap().forEach((i, icon) {
      var circleColor =
          (i == 0 || curStep! > i + 1) ? activeColor : inactiveColor;

      var lineColor = curStep! > i + 1 ? activeColor : inactiveColor;

      var iconColor =
          (i == 0 || curStep! > i + 1) ? inactiveColor : activeColor;

      list.add(
        Container(
          width: 40.0,
          height: 40.0,
          padding: const EdgeInsets.all(0),
          child: Icon(
            icon,
            color: iconColor,
            size: 25.0,
          ),
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      );

      if (i != icons!.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }
}
