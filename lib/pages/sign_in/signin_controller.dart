

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "you need to fill email address");
          return;
      
          //
        }
        if (password.isEmpty) {
        
          toastInfo(msg: "you need to fill password");
          return;
          //

        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "you dont exist");
            return;
            //
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "you need to verify email");
            return;
          }

          var user = credential.user;
          if (user != null) {
            print('user exist');
            // we got verified user from firebase

          } else {
            print('no user');
            toastInfo(msg: "currently you are not a user of this platform");
            return;
            //error from firebase

          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email');
            toastInfo(msg: "No user found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
            toastInfo(msg: "wrong password provided for that user");
            return;
          }
          else if(e.code == 'invalid-email'){
            print('Your email format is wrong');
              toastInfo(msg: "Wrong email format for that user");
              return;
            

          }
        }
      }
    } catch (e) {}
  }
}
