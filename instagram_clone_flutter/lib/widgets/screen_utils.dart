import 'package:flutter/material.dart';

extension NumX on double {
  // margin EdgeInsets
  EdgeInsets marginLeft() => EdgeInsets.only(left: this);
  EdgeInsets marginRight() => EdgeInsets.only(right: this);
  EdgeInsets marginTop() => EdgeInsets.only(top: this);
  EdgeInsets marginBottom() => EdgeInsets.only(bottom: this);
  EdgeInsets marginAll() => EdgeInsets.all(this);
  EdgeInsets marginVertical() => EdgeInsets.symmetric(vertical: this);
  EdgeInsets marginHorizontal() => EdgeInsets.symmetric(horizontal: this);

  // margin EdgeInsets
  EdgeInsets paddingLeft() => EdgeInsets.only(left: this);
  EdgeInsets paddingRight() => EdgeInsets.only(right: this);
  EdgeInsets paddingTop() => EdgeInsets.only(top: this);
  EdgeInsets paddingBottom() => EdgeInsets.only(bottom: this);
  EdgeInsets paddingAll() => EdgeInsets.all(this);
  EdgeInsets paddingVertical() => EdgeInsets.symmetric(vertical: this);
  EdgeInsets paddingHorizontal() => EdgeInsets.symmetric(horizontal: this);

  // Border
  BorderRadius circulrBorder() => BorderRadius.circular(this);

  Widget dividerH({color = const Color(0xFFc9c9c9)}) {
    return Container(
      height: toDouble(),
      color: color,
      width: double.infinity,
    );
  }

  Widget dividerV({color = Colors.grey}) {
    return Container(
      height: toDouble(),
      color: color,
      width: double.infinity,
    );
  }

  Widget divider({
    color = Colors.grey,
    width = double.infinity,
    height = double.infinity,
  }) {
    return Container(
      color: color,
      width: width,
      height: height,
    );
  }
}

extension WidgetX on Widget {
  Widget wrapContainer({
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color color = Colors.transparent,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      color: color,
      child: this,
    );
  }

  Widget wrapCenter() {
    return Center(
      child: this,
    );
  }

  Widget wrapPaddingOnly(
      {double left = 0.0,
      double right = 0.0,
      double top = 0.0,
      double bottom = 0.0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget wrapPadding({EdgeInsets padding = const EdgeInsets.all(0)}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addGestureTap(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  Widget wrapPaddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget wrapPaddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget wrapPaddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget wrapPaddingSymmetric(
      {double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget clipRectAll(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: this,
    );
  }

  Widget clipRect(BorderRadius radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget wrapPaddingTop(double top) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  Widget wrapPaddingBottom(double bottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  Widget wrapPaddingLeft(double left) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  Widget wrapPaddingRight(double right) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  addMarginBottom(double margin) {
    return Column(children: [
      this,
      SizedBox(
        height: margin,
      )
    ]);
  }

  addMarginTop(double margin) {
    return Column(children: [
      SizedBox(
        height: margin,
      ),
    ]);
  }

  addMargin(double margin) {
    return Row(
      children: [
        SizedBox(
          height: margin,
        ),
        Column(children: [
          SizedBox(
            height: margin,
          ),
          this,
          SizedBox(
            height: margin,
          )
        ]),
        SizedBox(
          height: margin,
        ),
      ],
    );
  }

  addMarginRight(double margin) {
    return Padding(
      padding: margin.paddingRight(),
      child: this,
    );
  }

  addMarginLeft(double margin) {
    return Padding(
      padding: margin.paddingLeft(),
      child: this,
    );
  }

  addMarginVertical(double margin) {
    return Padding(
      padding: margin.paddingVertical(),
      child: this,
    );
  }

  addMarginHorizontal(double margin) {
    return Container(
      padding: margin.paddingHorizontal(),
      child: this,
    );
  }

  Widget expand(int flex) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget flexible(int flex, FlexFit flexFit) {
    return Flexible(
      flex: flex,
      fit: flexFit,
      child: this,
    );
  }

  Widget visiblity(bool visible) {
    return Visibility(
      visible: visible,
      child: this,
    );
  }

  Widget offstage(bool visible) {
    return Offstage(
      offstage: visible,
      child: this,
    );
  }

  ///Hides a widget
  Widget setVisibility(
          {Key? key, bool isVisible = false, bool maintainSize = false}) =>
      Visibility(
        key: key,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
        child: this,
      );

  Widget hide({Key? key, bool maintainSize = false}) => Visibility(
        key: key,
        visible: false,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
        child: this,
      );

  Widget show({Key? key, bool maintainSize = false}) => Visibility(
        key: key,
        visible: true,
        child: this,
      );

  /// Widget to show exception
  Widget errorWidget(Object ex) => ErrorWidget(ex);
}
