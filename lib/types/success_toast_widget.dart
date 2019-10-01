import 'package:flutter/material.dart';
import 'package:funky_toast/types/toast_widget.dart';

class SuccessToastWidget extends StatefulWidget {
  final String msg;

  SuccessToastWidget({@required this.msg});

  @override
  State<StatefulWidget> createState() {
    return _SuccessToastWidgetState(msg);
  }
}

class _SuccessToastWidgetState extends State<SuccessToastWidget> {
  final String msg;

  _SuccessToastWidgetState(@required this.msg);

  @override
  Widget build(BuildContext context) {
    return ToastWidget(
      msg: msg,
      icon: Icons.done,
      color: Color(0xff61A364),
    );
  }
}
