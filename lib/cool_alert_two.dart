library cool_alert_two;

import 'dart:async';

import 'package:flutter/material.dart';

import 'src/models/cool_alert_options.dart';
import 'src/utils/animate.dart';
import 'src/widgets/cool_alert_container.dart';

enum CoolAlertTwoType { success, error, warning, confirm, info, loading, custom }

enum CoolAlertTwoAnimType {
  scale,
  rotate,
  slideInDown,
  slideInUp,
  slideInLeft,
  slideInRight,
}

/// CoolAlertTwo.
class CoolAlertTwo {
  static Future show({
    /// BuildContext
    required BuildContext context,

    /// Title of the dialog
    String? title,

    /// Text of the dialog
    String? text,

    /// Custom Widget of the dialog
    Widget? widget,

    // Alert type [success, error, warning, confirm, info, loading, custom]
    required CoolAlertTwoType type,

    // Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    CoolAlertTwoAnimType animType = CoolAlertTwoAnimType.scale,

    /// Barrier Dissmisable
    bool barrierDismissible = true,

    // Triggered when confirm button is tapped
    VoidCallback? onConfirmBtnTap,

    /// Triggered when cancel button is tapped
    VoidCallback? onCancelBtnTap,

    /// Confirmation button text
    String confirmBtnText = 'Ok',

    /// Cancel button text
    String cancelBtnText = 'Cancel',

    /// Color for confirm button
    Color confirmBtnColor = const Color(0xFF3085D6),

    /// TextStyle for confirm button
    TextStyle? confirmBtnTextStyle,

    /// TextStyle for cancel button
    TextStyle? cancelBtnTextStyle,

    /// TextStyle for title
    TextStyle? titleTextStyle,

    /// TextStyle for main text
    TextStyle? textTextStyle,

    /// Determines if cancel button is shown or not
    bool showCancelBtn = false,

    /// Dialog Border Radius
    double borderRadius = 10.0,

    /// Header background color
    Color backgroundColor = const Color(0xFF515C6F),

    /// Flare asset path
    String? flareAsset,

    /// Flare animation name
    String flareAnimationName = 'play',

    /// Asset path of your lottie file
    String? lottieAsset,

    /// Width of the dialog
    double? width,

    /// Text alignment for title and body, default to center
    TextAlign? textAlignment,

    /// Determines how long the dialog stays open for before closing
    /// [default] is null
    /// When it is null, it won't autoclose
    Duration? autoCloseDuration,

    /// Detemines if the animation loops or not
    bool loopAnimation = false,
  }) {
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration, () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    final options = CoolAlertTwoOptions(
        title: title,
        text: text,
        widget: widget,
        type: type,
        animType: animType,
        barrierDismissible: barrierDismissible,
        onConfirmBtnTap: onConfirmBtnTap,
        onCancelBtnTap: onCancelBtnTap,
        confirmBtnText: confirmBtnText,
        cancelBtnText: cancelBtnText,
        confirmBtnColor: confirmBtnColor,
        confirmBtnTextStyle: confirmBtnTextStyle,
        cancelBtnTextStyle: cancelBtnTextStyle,
        showCancelBtn: showCancelBtn,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        flareAsset: flareAsset,
        flareAnimationName: flareAnimationName,
        lottieAsset: lottieAsset,
        width: width,
        loopAnimation: loopAnimation,
        textTextStyle: textTextStyle,
        titleTextStyle: titleTextStyle,
        textAlignment: textAlignment);

    final child = AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: CoolAlertTwoContainer(
        options: options,
      ),
    );

    return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, anim1, __, widget) {
        switch (animType) {
          case CoolAlertTwoAnimType.scale:
            return Animate.scale(child: child, animation: anim1);

          case CoolAlertTwoAnimType.rotate:
            return Animate.rotate(child: child, animation: anim1);

          case CoolAlertTwoAnimType.slideInDown:
            return Animate.slideInDown(child: child, animation: anim1);

          case CoolAlertTwoAnimType.slideInUp:
            return Animate.slideInUp(child: child, animation: anim1);

          case CoolAlertTwoAnimType.slideInLeft:
            return Animate.slideInLeft(child: child, animation: anim1);

          case CoolAlertTwoAnimType.slideInRight:
            return Animate.slideInRight(child: child, animation: anim1);

          default:
            return child;
        }
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible:
          autoCloseDuration != null ? false : barrierDismissible,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, _, __) => Container(),
    );
  }
}
