import 'package:cool_alert_two/cool_alert_two.dart';
import 'package:flutter/widgets.dart';

class CoolAlertTwoOptions {
  String? title;
  TextStyle? titleTextStyle;
  TextStyle? textTextStyle;
  TextAlign? textAlignment;
  String? text;
  Widget? widget;
  CoolAlertTwoType type;
  CoolAlertTwoAnimType? animType;
  bool? barrierDismissible = false;
  VoidCallback? onConfirmBtnTap;
  VoidCallback? onCancelBtnTap;
  String? confirmBtnText;
  String? cancelBtnText;
  Color? confirmBtnColor;
  TextStyle? confirmBtnTextStyle;
  TextStyle? cancelBtnTextStyle;
  bool? showCancelBtn;
  double? borderRadius;
  Color? backgroundColor;
  String? flareAsset;
  String? flareAnimationName;
  String? lottieAsset;
  double? width;
  bool loopAnimation;

  CoolAlertTwoOptions(
      {this.title,
      this.text,
      this.widget,
      required this.type,
      this.animType,
      this.barrierDismissible,
      this.onConfirmBtnTap,
      this.onCancelBtnTap,
      this.confirmBtnText,
      this.cancelBtnText,
      this.confirmBtnColor,
      this.confirmBtnTextStyle,
      this.cancelBtnTextStyle,
      this.showCancelBtn,
      this.borderRadius,
      this.backgroundColor,
      this.flareAsset,
      this.flareAnimationName,
      this.lottieAsset,
      this.width,
      this.loopAnimation = false,
      this.textTextStyle,
      this.titleTextStyle,
      this.textAlignment});
}
