import 'package:flutter/cupertino.dart';

class AppSize {
  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
