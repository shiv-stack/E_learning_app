import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocproviders{
  static get allBlocproviders=>[
    BlocProvider(
              create: (context) => WelcomeBloc(),
          ),
           BlocProvider(
              create: (context) => AppBlocs(),
          ),
           BlocProvider(
              create: (context) => SignInBloc(),
          ),

  ];
}