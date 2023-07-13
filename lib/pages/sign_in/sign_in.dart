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
                margin: EdgeInsets.only(top: 66.h),
                padding: EdgeInsets.only(left: 25.w),
                child: Column(
                  children: [
                    reusableText('Email'),
                  
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
