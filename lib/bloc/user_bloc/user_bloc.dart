import 'package:app/bloc/user_bloc/user_event.dart';
import 'package:app/bloc/user_bloc/user_state.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    /** MANEJO DE EVENTOS**/
    on<UserEvent>((event, emit) {
      print("ACTIVATE USER CALLED");
    });

    on<UserOnOffLineStateUserEvent>(((event, emit) {
      print("object : UserOnOffLineStateUserEvent");
      emit(UserOnOffLineState(event.isOnLineOffLineUser));
    }));
  }
}
