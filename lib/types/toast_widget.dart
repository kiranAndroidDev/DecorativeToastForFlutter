import 'package:flutter/material.dart';
import 'package:funky_toast/Toast.dart';
import 'package:funky_toast/funky_toast.dart';

class ToastWidget extends StatefulWidget {
  final String msg;
  final IconData icon;
  final Color color;
  final ToastLength length;

  ToastWidget({@required this.msg, this.icon, this.color, this.length});

  @override
  State<StatefulWidget> createState() {
    return _ToastWidgetState(msg, icon: icon, color: color, length: length);
  }
}

class _ToastWidgetState extends State<ToastWidget>
    with TickerProviderStateMixin {
  final String msg;
  final IconData icon;
  final Color color;
  final ToastLength length;

  _ToastWidgetState(this.msg, {this.icon, this.color, this.length});

  bool show = true;

  @override
  void initState() {
    super.initState();
    _getOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: color),
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
                visible: icon != null ? true : false,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Text(
                  msg,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          )
    );
  }

  Duration _getToastLength(ToastLength length) {
    if (length == ToastLength.LENGTH_LONG)
      return Duration(seconds: 6);
    else
      return Duration(milliseconds: 500);
  }

  _getOpacity() async {
    if (!show)
      return;
    else {
      await Future.delayed(_getToastLength(length));
      if (this.mounted) {
        setState(() {
          show = !show;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
