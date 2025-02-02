import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/sign_in_screen/presentation/pages/success_sign_in_screen.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  SignInBloc() : super(SignInInitial()) {
    on<SignIn>((event, emit) async{
      BotToast.showLoading();
      await Future.delayed(Duration(seconds: 5));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: event.email, password: event.password).then((onValue){
          BotToast.closeAllLoading();
          BotToast.showText(text: 'Welcome');
          Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (context)=>SuccessSignInScreen()));
        }).catchError((onError){
          BotToast.closeAllLoading();
          BotToast.showText(text: 'Failed - Try again');
        });
      }on Exception catch (e) {
        print(e);
      }

    });
  }
}
