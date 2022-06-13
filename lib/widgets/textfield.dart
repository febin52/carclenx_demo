import 'package:flutter/material.dart';

class TextFieldWidget {
  static Widget commonField(BuildContext context, hint) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}
