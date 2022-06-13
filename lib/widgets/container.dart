
import 'package:carclenx_demo/utilities/appsizes.dart';
import 'package:flutter/material.dart';

class CommonContainer {
  static Widget commonContainer(
      BuildContext context, Widget child, width, height, color) {
    return Container(
      width: AppSize.width(context) / width,
      height: AppSize.height(context) / height,
      padding: const EdgeInsets.all(18.0),
      decoration:  BoxDecoration(
        color:color,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: child,
    );
  }
}
