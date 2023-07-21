import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
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
                    buildTextField('Enter your Email Address', 'email', 'user'),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText('Password'),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField('Enter your Password', 'password', 'lock'),
                    SizedBox(
                      height: 5.h,
                    ),
                    forgotPassword("Forgot password"),
                    buildLogInRegButton("Log In", "login"),
                    buildLogInRegButton("Register", "register"),
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
