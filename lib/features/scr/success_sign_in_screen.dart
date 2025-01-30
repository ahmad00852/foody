import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/home/presentation/pages/home_layout.dart';


class SuccessSignInScreen extends StatelessWidget {
  const SuccessSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/image.png'),
              30.verticalSpace,
              Text(
                'Yeay! Completed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              6.verticalSpace,
              Text(
                '   Now you are able to order \n some foods as a self-reward',
                style: TextStyle(color: ConstColor().secondTextColor),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeLayout()));
                },
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                      color: ConstColor().mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Find Foods',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
