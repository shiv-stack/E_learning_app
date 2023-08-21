import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';



class AppBlocproviders{
  static get allBlocproviders=>[
    BlocProvider(
              create: (context) => WelcomeBloc(),
          ),
          //  BlocProvider(
          //     create: (context) => AppBlocs(),
          // ),
           BlocProvider(
              create: (context) => SignInBloc(),
          ),
           BlocProvider(
              create: (context) => RegisterBloc(),
          ),


  ];
}