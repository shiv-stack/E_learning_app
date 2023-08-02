import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import '../sign_in/bloc/signin_bloc.dart';
import '../sign_in/bloc/signin_states.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              // buildThirdPartyLOgin(context),
              Center(
                  child: reusableText(
                      'Enter your details below and free Sign Up')),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('User Name'),
                    buildTextField('Enter your User Name', 'name', 'user',
                        (value) {
                      // context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText('Email'),
                    buildTextField('Enter your Email Address', 'email', 'user',
                        (value) {
                      // context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText('Password'),
                    buildTextField('Enter your Password', 'password', 'lock',
                        (value) {
                      // context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                    reusableText('Confirm Password'),
                    buildTextField(
                        'Enter Again to Confirm Password', 'password', 'lock',
                        (value) {
                      // context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                          'Enter your details below and free Sign Up'),
                    ),
                    buildLogInRegButton("Sign Up", "login", (() {
                      // Navigator.of(context).pushNamed("/register");
                    })),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
