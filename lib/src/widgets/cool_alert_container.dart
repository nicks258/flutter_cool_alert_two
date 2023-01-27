import 'package:cool_alert_two/cool_alert_two.dart';
import 'package:cool_alert_two/src/constants/images.dart';
import 'package:cool_alert_two/src/models/cool_alert_options.dart';
import 'package:cool_alert_two/src/utils/single_loop_controller.dart';
import 'package:cool_alert_two/src/widgets/cool_alert_buttons.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CoolAlertTwoContainer extends StatelessWidget {
  final CoolAlertTwoOptions? options;

  const CoolAlertTwoContainer({
    Key? key,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _header = _buildHeader(context);
    final _title = _buildTitle(context);
    final _text = _buildText(context);
    final _buttons = _buildButtons();
    final _widget = _buildWidget(context);

    final _content = Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          _title,
          SizedBox(
            height: 5.0,
          ),
          _text,
          _widget!,
          SizedBox(
            height: 10.0,
          ),
          _buttons
        ],
      ),
    );

    return Container(
      width: options!.width ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_header, _content],
      ),
    );
  }

  Widget _buildHeader(context) {
    if (options!.type == CoolAlertTwoType.loading) {
      return Container();
    } else {
      String? anim = AppAnim.success;

      switch (options!.type) {
        case CoolAlertTwoType.success:
          anim = AppAnim.success;
          break;
        case CoolAlertTwoType.error:
          anim = AppAnim.error;
          break;
        case CoolAlertTwoType.warning:
          anim = AppAnim.warning;
          break;
        case CoolAlertTwoType.confirm:
          anim = AppAnim.info;
          break;
        case CoolAlertTwoType.info:
          anim = AppAnim.info;
          break;
        default:
          anim = AppAnim.info;
      }

      if (options!.flareAsset != null) {
        anim = options!.flareAsset;
      }
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: options!.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(options!.borderRadius!),
            topRight: Radius.circular(options!.borderRadius!),
          ),
        ),
        child: Container(
          height: 150,
          width: 150,
          child: options!.lottieAsset == null
              ? FlareActor(
                  anim,
                  animation: options!.loopAnimation
                      ? options!.flareAnimationName
                      : null,
                  controller: options!.loopAnimation
                      ? null
                      : SingleLoopController(
                          options!.flareAnimationName!,
                          1,
                        ),
                )
              : Lottie.asset(options!.lottieAsset!,
                  repeat: options!.loopAnimation),
        ),
      );
    }
  }

  Widget _buildTitle(context) {
    if (options!.type == CoolAlertTwoType.loading) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Container(
          height: 100,
          width: 100,
          child: options!.lottieAsset == null
              ? FlareActor(
                  AppAnim.loading,
                  animation: options!.flareAnimationName,
                )
              : Lottie.asset(options!.lottieAsset!),
        ),
      );
    } else {
      final title = options!.title ?? _whatTitle();
      return Visibility(
        visible: title != null,
        child: Text(
          '$title',
          textAlign: options!.textAlignment ?? TextAlign.center,
          style:
              options!.titleTextStyle ?? Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
  }

  Widget _buildText(context) {
    if (options!.text == null && options!.type != CoolAlertTwoType.loading) {
      return Container();
    } else {
      String? text = '';
      if (options!.type == CoolAlertTwoType.loading) {
        text = options!.text ?? 'Loading...';
      } else {
        text = options!.text;
      }
      return Text(
        text ?? '',
        textAlign: options!.textAlignment ?? TextAlign.center,
        style: options!.textTextStyle,
      );
    }
  }

  Widget? _buildWidget(context) {
    if (options!.widget == null && options!.type != CoolAlertTwoType.custom) {
      return Container();
    } else {
      Widget widget = Container();
      if (options!.type == CoolAlertTwoType.custom) {
        widget = options!.widget ?? widget;
      }
      return options!.widget;
    }
  }

  Widget _buildButtons() {
    if (options!.type == CoolAlertTwoType.loading) {
      return Container();
    } else {
      return CoolAlertTwoButtons(
        options: options,
      );
    }
  }

  String? _whatTitle() {
    switch (options!.type) {
      case CoolAlertTwoType.success:
        return 'Success!!!';
      case CoolAlertTwoType.error:
        return 'Error!!!';
      case CoolAlertTwoType.warning:
        return 'Warning!!!';
      case CoolAlertTwoType.confirm:
        return 'Are you sure?';
      case CoolAlertTwoType.info:
        return 'Info!';
      case CoolAlertTwoType.custom:
        return null;
      case CoolAlertTwoType.loading:
        return null;
      default:
        return null;
    }
  }
}
