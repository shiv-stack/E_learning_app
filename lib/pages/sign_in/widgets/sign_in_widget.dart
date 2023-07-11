import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        // height defines thickness of the line
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(
        " Log IN",
        style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}

// we need context for accessing blocc
Widget buildThirdPartyLOgin(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
        top: 40.h,
        bottom: 20.h
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _resuableIcons("google"),
        _resuableIcons("apple"),
        _resuableIcons("facebook"),
        ],
      ),
    ),
  );
}


Widget _resuableIcons (String IconName){
  return GestureDetector(
            onTap: (){

            },
            child: SizedBox(width: 40.w,height: 40.w,
            child: Image.asset("assets/icons/$IconName.png"),),
          );

}
