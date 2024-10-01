import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/style.util.dart';

extension StringExtensions on String {
  String get parsed => Uri.decodeFull(this);
  String get splitted => this.split('_').join(' ').toTitleCase();
  String get nullSafe => this;
  String get nullSafeEmpty => this;
  String get asAmount =>
      double.parse('${double.tryParse(this) ?? 0}').ceil().toStringAsFixed(2);
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((String str) => str.toCapitalized())
      .join(' ');

  void showError() => BotToast.showSimpleNotification(
        backgroundColor: Style.colors.error,
        titleStyle: Style.textStyles.primary(
          color: Style.colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
        title: this,
        align: Alignment.bottomCenter,
        backButtonBehavior: BackButtonBehavior.ignore,
      );
  void showSuccess() => BotToast.showSimpleNotification(
        backgroundColor: Style.colors.green,
        titleStyle: Style.textStyles.primary(
          color: Style.colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
        title: this,
        align: Alignment.bottomCenter,
        backButtonBehavior: BackButtonBehavior.ignore,
      );
  Widget assetImage(
          {required double? height,
          required double? width,
          Color? color,
          BoxFit? fit}) =>
      Image.asset(
        this,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );

  Widget networkImage(
          {required double? height,
          required double? width,
          Color? color,
          BoxFit? fit}) =>
      CachedNetworkImage(
        imageUrl: this,
        height: 12.h,
        width: 50.w,
      );

}

extension DoubleExtensions on double {
  Widget get hGap => SizedBox(height: this);
  Widget get wGap => SizedBox(width: this);
}

extension IntExtensions on int {


}


extension DynamicExtensions on dynamic {
  bool get isNotNull => !isNullOrBlank(this);
  String get nullSafe => this ?? '-';
  String get nullSafeEmpty => this ?? '';
}

extension NullExtensions on Null {
  String get nullSafe => this ?? '-';
  String get nullSafeEmpty => this ?? '';
}

extension WidgetExtensions on Widget {
  Widget onTap(void Function()? tapEvent) => GestureDetector(
        onTap: tapEvent,
        child: this,
      );
  Widget sized({
    double? height,
    double? width,
  }) =>
      SizedBox(
        height: height,
        width: width,
        child: this,
      );
}

