import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/sign_up_screen/presentation/pages/sign_up_address_screen.dart';

import '../../../Widgets/text_feild.dart';
import '../../../const/const_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ConstColor().mainColor,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
                    ),
                  ),
                  15.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign Up',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: ConstColor().textColor)),
                      Text(
                        'Register and eat',
                        style: TextStyle(
                            fontSize: 18, color: ConstColor().secondTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              58.verticalSpace,
              textFormFieldWidget(
                  textFormName: 'Full Name',
                  validator: (value) {
                    if (value !=null && value.length >= 10) {
                      return null;
                    } else {
                      return 'Enter a password longer than 5 characters';
                    }
                  },
                  controller: emailController,
                  hintText: 'Type your full name'),
              16.verticalSpace,
              textFormFieldWidget(
                  textFormName: 'Email Address',
                  validator: (value) {
                    if (value!.contains('@')) {
                      return null;
                    } else {
                      return 'Enter A Valid Email';
                    }
                  },
                  controller: emailController,
                  hintText: 'Type your email address'),
              16.verticalSpace,
              textFormFieldWidget(
                  textFormName: 'Password',
                  validator: (value) {
                    if (value != null && value.length >= 6) {
                      return null;
                    } else {
                      return 'Enter a password longer than 6 characters';
                    }
                  },
                  controller: passwordController,
                  hintText: 'Type your password'),
              24.verticalSpace,
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpAddressScreen()));},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ConstColor().mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ),
              ),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I Already Have an Account ',
                    style: TextStyle(color: Color(0xff575757)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: ConstColor().mainColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
