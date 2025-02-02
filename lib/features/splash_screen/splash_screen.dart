import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/sign_in_screen/presentation/bloc/sign_in_bloc.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../sign_in_screen/presentation/pages/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundColor: ConstColor().mainColor,
      logo: Image.asset('assets/icons/foody icon.png'),
      duration: Duration(seconds: 5),
      showStatusBar: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          'Foody', style: TextStyle(fontSize: 40, color: Colors.white),),
      ),
      done: Done(BlocProvider(
        create: (context) => SignInBloc(),
        child: SignInScreen(),
      )),
    );
  }
}
