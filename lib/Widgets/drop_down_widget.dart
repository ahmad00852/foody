import 'package:flutter/material.dart';
import 'package:form_filed_drop_down/form_filed_drop_down.dart';

import '../const/const_color.dart';

Widget formFiledDropDownWidget(
{
  required itemController,
  required cities,

}
    ){
  return SizedBox(
    height: 45,
    child: FormFiledDropDown<String>(
      menuDecoration: BoxDecoration(color: Colors.white),
      controller: itemController,
      filedReadOnly: true,
      showCursor: false,
      item: cities,
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400),
      filedDecoration: InputDecoration(
          hintText: 'Select your city',
          hintStyle: TextStyle(
              fontSize: 16, color: ConstColor().secondTextColor),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: ConstColor().secondTextColor),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide:
              BorderSide(color: ConstColor().secondTextColor),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: ConstColor().secondTextColor),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: Icon(Icons.chevron_left)),
      onChanged: (String? value) {},
      listItemBuilder: (context, item, isSelected) {
        return Text(
          item,
          style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400),
        );
      },
    ),
  );
}