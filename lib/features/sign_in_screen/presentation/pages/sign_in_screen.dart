import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Widgets/facebook_google_widget.dart';
import 'package:foody/Widgets/text_feild.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/sign_in_screen/data/data_sources/data_provider.dart';
import 'package:foody/features/sign_in_screen/presentation/bloc/sign_in_bloc.dart';
import 'package:foody/features/sign_up_screen/presentation/bloc/sign_up_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../../sign_up_screen/presentation/pages/sign_up_screen.dart';
import '../widgets/password_text_feild_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();
class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                Text('Sign In',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: ConstColor().textColor)),
                Text(
                  'Find your best ever meal',
                  style: TextStyle(
                      fontSize: 18, color: ConstColor().secondTextColor),
                ),
                58.verticalSpace,
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
                passwordTextFormFieldWidget(
                    textFormName: 'Password',
                    validator: (value) {
                      if (value != null && value.length >= 6) {
                        return null;
                      } else {
                        return 'Enter a password longer than 6 characters';
                      }
                    },
                    controller: passwordController,
                    hintText: 'Type your password',
                    isSecure:Provider.of<DataProvider>(context).isSecure,
                    icon: IconButton(
                        onPressed: () {
                          Provider.of<DataProvider>(context,listen: false).isSecure
                              ? context.read<DataProvider>().changeSecure(false)
                              : context.read<DataProvider>().changeSecure(true);
                        },
                        icon: Provider.of<DataProvider>(context).isSecure?Icon(AntDesign.eye_fill):Icon(AntDesign.eye_invisible_fill))),
                24.verticalSpace,
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignInBloc>(context).add(SignIn(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: ConstColor().mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    );
                  },
                ),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'forget password',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: ConstColor().mainColor,
                          fontSize: 16,
                          color: ConstColor().mainColor),
                    )
                  ],
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '- OR Continue with -',
                      style: TextStyle(color: Color(0xff575757)),
                    )
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){BlocProvider.of<SignInBloc>(context).add(SignInWithGoogle(context: context));},
                        child: facebookGoogleWidget(name: 'google', imageName: 'google')),
                  ],
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create An Account ',
                      style: TextStyle(color: Color(0xff575757)),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => SignUpBloc(),
                                        child: SignUpScreen(),
                                      )));
                        },
                        child: Text(
                          'Sign Up',
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
      ),
    );
  }
}
