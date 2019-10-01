import 'package:flutter/material.dart';
import 'package:funky_toast/types/toast_widget.dart';

class InfoToastWidget extends StatefulWidget {
  final String msg;

  InfoToastWidget({@required this.msg});

  @override
  State<StatefulWidget> createState() {
    return _InfoToastWidgetState(msg);
  }
}

class _InfoToastWidgetState extends State<InfoToastWidget> {
  final String msg;

  _InfoToastWidgetState(this.msg);

  @override
  Widget build(BuildContext context) {
    return ToastWidget(msg: msg, icon: Icons.info, color: Color(0xff1872D1));
  }
}
