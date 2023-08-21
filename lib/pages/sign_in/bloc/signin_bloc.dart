import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {

    // print('my email  is ${event.email}');
    emit(state.copyWith(email: event.email));

  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    //  print('my password is ${event.password}');
     
    emit(state.copyWith(password: event.password));
  }
}
