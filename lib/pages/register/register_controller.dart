

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if (userName.isEmpty) {
      toastInfo(msg: "user name cannot be empty ");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "email cannot be empty ");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "password cannot be empty ");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "password confirmation is wrong ");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To Activate please click on the link");
                Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        toastInfo(msg: 'the password you provided is weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'email already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'your email is invalid');
      }
    }
  }
}
