import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/features/sign_in_screen/presentation/pages/success_sign_in_screen.dart';
import 'package:foody/features/sign_up_screen/data/data_sources/store_new_user.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUp>((event, emit) async {
      BotToast.showLoading();
      await Future.delayed(Duration(seconds: 5));
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((signInUser) {
          UserManagement().storeNewUser(signInUser.user, event.context,event.name);
          BotToast.closeAllLoading();
          BotToast.showText(text: 'Welcome');
          Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (context)=>SuccessSignInScreen()));
        }).catchError((onError) {
          BotToast.closeAllLoading();
          BotToast.showText(text: 'Failed - Try again');
        });
      } on Exception catch (e) {
        print(e);
      }
    });
  }
}
