import 'package:flutter/material.dart';
import 'package:funky_toast/types/toast_widget.dart';

class ErrorToastWidget extends StatefulWidget {
  final String msg;

  ErrorToastWidget({@required this.msg});

  @override
  State<StatefulWidget> createState() {
    return _ErrorToastWidgetState(msg);
  }
}

class _ErrorToastWidgetState extends State<ErrorToastWidget> {
  final String msg;

  _ErrorToastWidgetState(this.msg);

  @override
  Widget build(BuildContext context) {
    return ToastWidget(msg: msg, icon: Icons.close, color: Colors.red);
  }
}
