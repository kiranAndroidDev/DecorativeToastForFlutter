

class Toast {
  final ToastType type;
  final String msg;
  final ToastLength length;
  final ToastGravity gravity;

  Toast(this.msg, {this.type, this.length, this.gravity}) {
    assert(msg != null);
  }
}

enum ToastLength { LENGTH_SHORT, LENGTH_LONG }

enum ToastGravity { TOP, BOTTOM, CENTER }
enum ToastType { SUCCESS, WARN, ERROR, INFO, DEFAULT }
