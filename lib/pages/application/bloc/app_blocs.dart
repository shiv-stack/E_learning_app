import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';
import 'package:ulearning_app/pages/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggerEvent>(
      (event, emit) {
        print("my tapped index is ${event.index}");
        emit(AppStates(index: event.index));
      },
    );
  }
}


