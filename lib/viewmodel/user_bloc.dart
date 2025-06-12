import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_bloc_flutter/viewmodel/user_event.dart';
import 'package:listview_bloc_flutter/viewmodel/user_state.dart';
import '../repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>
{
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial())
  {
    on<LoadUsers>((event, emit) async
    {
      emit(UserLoading());
      try
      {
        final users = await userRepository.getUsers();
        emit(UserLoaded(users));
      }
      catch (e)
      {
        emit(UserError("Failed to fetch users"));
      }
    });
  }
}