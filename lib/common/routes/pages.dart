//unify bloc providers and

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application_page.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';

import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: Approutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: Approutes.SIGN_IN,
        page: Signin(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(   
        route: Approutes.REGISTER,
        page: Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: Approutes.APPLICATION,
        page: ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      )
    ];
  }

  //return  all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

//a modal that covers entire screen as we collect on navigator object.
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name!=null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("first log"); 
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDEviceFirstOpen();
        if(result.first.route==Approutes.INITIAL&&deviceFirstOpen) {
          // bool isLoggedIn =  Global.storageService.getIsLoggedIn();
          // if(isLoggedIn){
          //   return MaterialPageRoute(builder: (_)=>const ApplicationPage(),settings: settings);
          // }



          print('second log');
          return MaterialPageRoute(
              builder: (_) => const Signin(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("in-valid  route name${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const Signin(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
