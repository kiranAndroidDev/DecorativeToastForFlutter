import 'package:flutter/material.dart';
import 'package:funky_toast/types/toast_widget.dart';

class WarningToastWidget extends StatefulWidget {
  final String msg;

  WarningToastWidget({@required this.msg});

  @override
  State<StatefulWidget> createState() {
    return _WarningToastWidgetState(msg);
  }
}

class _WarningToastWidgetState extends State<WarningToastWidget> {
  final String msg;

  _WarningToastWidgetState(this.msg);

  @override
  Widget build(BuildContext context) {
    return ToastWidget(msg: msg, icon: Icons.warning, color: Color(0xffF3AF18));
  }
}
