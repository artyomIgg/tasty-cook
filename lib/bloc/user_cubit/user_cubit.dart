import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/services/database_service/database_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserModel? user;

  Future<UserModel?> getUser() async {
    final UserModel? user = await DatabaseService().getUser();

    if(user != null) {
      emit(UserLoaded(user));
      this.user = user;
      return user;
    } else {
      emit(UserError('User not found'));
      return null;
    }
  }

  Future<void> saveUser(UserModel user) async {
    await DatabaseService().saveUser(user);
    emit(UserSaved(user));
  }
}
