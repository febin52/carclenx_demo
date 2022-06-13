import 'package:carclenx_demo/utilities/appsizes.dart';
import 'package:flutter/material.dart';

class DropDownButtonClass {
  
  static Widget dropDown(context, width, title,selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(width: 1.0, color: Colors.grey)),
          width: AppSize.width(context) / width,
          child: DropdownButton(
            
              underline:
                  const DropdownButtonHideUnderline(child: SizedBox.shrink()),
              alignment: Alignment.center,
              hint: const Text("--Select--"),
              isExpanded: true,
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                selectedValue = newValue;
              }),
        ),
      ],
    );
  }
}
