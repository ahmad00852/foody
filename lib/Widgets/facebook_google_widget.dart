import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/const_color.dart';

Widget facebookGoogleWidget(
{required String name,
  required String imageName
}
    ){
  return Container(
    height: 50,
    width: 130,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: ConstColor().mainColor.withOpacity(.1)
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/$imageName.png'),
          10.horizontalSpace,
          Text(name),
        ],
      ),
    ),
  );
}