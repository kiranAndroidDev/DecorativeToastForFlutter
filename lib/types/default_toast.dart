import 'package:flutter/material.dart';
import 'package:funky_toast/types/toast_widget.dart';

class DefaultToastWidget extends StatefulWidget {
  final String msg;

  DefaultToastWidget({@required this.msg});

  @override
  State<StatefulWidget> createState() {
    return _DefaultToastWidgetState(msg);
  }
}

class _DefaultToastWidgetState extends State<DefaultToastWidget> {
  final String msg;

  _DefaultToastWidgetState(this.msg);

  @override
  Widget build(BuildContext context) {
    return ToastWidget(msg: msg, color: Colors.black54);
  }
}
