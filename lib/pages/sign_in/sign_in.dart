import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';
import 'package:ulearning_app/pages/sign_in/signin_controller.dart';

import '../common_widgets.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Login In"),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLOgin(context),
                Center(child: reusableText('or use  your email account login')),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          'Enter your Email Address', 'email', 'user', (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusableText('Password'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField('Enter your Password', 'password', 'lock',
                          (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      SizedBox(
                        height: 5.h,
                      ),
                      forgotPassword("Forgot password"),
                      buildLogInRegButton("Log In", "login", (() {
                        print('login button');
                        SignInController(context: context)
                            .handleSignIn("email");
                      })),
                      buildLogInRegButton("Sign Up", "register", (() {
                        Navigator.of(context).pushNamed("/register");
                      })),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      );
    });
  }
}
