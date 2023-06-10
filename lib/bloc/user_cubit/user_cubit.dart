import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/repositories/user_repository/user_repository.dart';
import 'package:tasty_cook/services/database_service/database_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
    getUserFormApi();
  }

  UserModel? user;

  Future<UserModel?> getUser() async {
    final UserModel? user = await DatabaseService().getUser();

    if (user != null) {
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

  Future<void> getUserFormApi() async {
    emit(UserLoading());

    final UserModel? user = await UserRepository().getUser();

    if (user != null) {
      await saveUser(user);
      this.user = user;
      emit(UserLoaded(user));
    } else {
      emit(UserError('User not found'));
    }
  }
}
