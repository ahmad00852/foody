import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/const/const_color.dart';
Widget passwordTextFormFieldWidget(
    {required String textFormName,
      required String hintText,
      required FormFieldValidator<String> validator,
      required TextEditingController controller,
      required bool isSecure,
      required IconButton icon
    }
    ){
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' $textFormName',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        5.verticalSpace,
        SizedBox(
          child: TextFormField(
            obscureText: isSecure,
            controller: controller,
            validator: validator,
            cursorColor: ConstColor().secondTextColor,
            decoration: InputDecoration(
              suffixIcon: icon,
                hintText: hintText,
                hintStyle: TextStyle(color: ConstColor().secondTextColor),
                border: const OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: ConstColor().secondTextColor)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: ConstColor().secondTextColor)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: ConstColor().secondTextColor)
                )
            ),
          ),
        ),
      ],
    ),
  );
}