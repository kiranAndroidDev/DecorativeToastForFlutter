import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funky_toast/Toast.dart';
import 'package:funky_toast/types/default_toast.dart';
import 'package:funky_toast/types/info_toast_widget.dart';

import 'package:funky_toast/types/success_toast_widget.dart';
import 'package:funky_toast/types/error_toast_widget.dart';
import 'package:funky_toast/types/warning_toast_widget.dart';

class FunkyToast {
  void show({@required BuildContext context, @required Toast toast}) {
    _FunkyToastView.getToastView(
        context, toast.msg, toast.type, toast.length, toast.gravity);
  }
}

class _FunkyToastView {
  static final _FunkyToastView _funkyToastView = new _FunkyToastView.internal();

  static var _overlayEntry;
  static bool _isShown = false;

  factory _FunkyToastView() {
    return _funkyToastView;
  }

  _FunkyToastView.internal();

  static getToastView(BuildContext context, String msg, ToastType type,
      ToastLength length, ToastGravity gravity) async {
    dismissToast();
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) {
        return SafeArea(
            child: Container(
                alignment: _getToastGravity(gravity),
                padding: _getMargin(gravity),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[_getToastType(type, msg)],
                )));
      },
    );

    overlayState.insert(_overlayEntry);
    _isShown = true;
    await new Future.delayed(_getToastLength(length));
    dismissToast();
  }

  static dismissToast() async {
    if (!_isShown)
      return;
    else {
      _isShown = false;
      _overlayEntry?.remove();
    }
  }
}

Duration _getToastLength(ToastLength length) {
  if (length == ToastLength.LENGTH_LONG)
    return Duration(seconds: 2);
  else
    return Duration(seconds: 2);
}

Alignment _getToastGravity(ToastGravity gravity) {
  switch (gravity) {
    case ToastGravity.TOP:
      return Alignment.topCenter;
      break;
    case ToastGravity.BOTTOM:
      return Alignment.bottomCenter;
      break;
    case ToastGravity.CENTER:
      return Alignment.center;
      break;
    default:
      return Alignment.bottomCenter;
      break;
  }
}

EdgeInsets _getMargin(ToastGravity gravity) {
  switch (gravity) {
    case ToastGravity.TOP:
      return EdgeInsets.only(top: 100);
      break;
    case ToastGravity.BOTTOM:
      return EdgeInsets.only(bottom: 100);
      break;
    case ToastGravity.CENTER:
      return EdgeInsets.all(0);
      break;
    default:
      return EdgeInsets.only(bottom: 100);
      break;
  }
}

Widget _getToastType(ToastType type, String msg) {
  switch (type) {
    case ToastType.SUCCESS:
      return SuccessToastWidget(msg: msg);
      break;
    case ToastType.WARN:
      return WarningToastWidget(msg: msg);
      break;
    case ToastType.ERROR:
      return ErrorToastWidget(msg: msg);
      break;
    case ToastType.INFO:
      return InfoToastWidget(msg: msg);
      break;
    case ToastType.DEFAULT:
      return DefaultToastWidget(msg: msg);
      break;
  }
}
