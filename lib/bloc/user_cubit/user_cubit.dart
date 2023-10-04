import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/repositories/user_repository/user_repository.dart';
import 'package:tasty_cook/services/database_service/database_service.dart';
import 'package:tasty_cook/utils/text_validators/text_validator.dart';

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

  Future<bool> changePassword(
    String oldPassword,
    String newPassword1,
    String newPassword2,
  ) async {
    emit(PasswordLoading());

    final bool validatePass = validatePassword(newPassword1);

    if (!validatePass) {
      return false;
    }

    final bool isRepeatedPassword =
        isRepeatedPasswords(newPassword1, newPassword2);

    if (!isRepeatedPassword) {
      return false;
    }

    final bool isChanged = await UserRepository().changePassword(
      oldPassword: oldPassword,
      newPassword1: newPassword1,
      newPassword2: newPassword2,
    );

    if (isChanged) {
      emit(PasswordChanged());
      return true;
    } else {
      emit(PasswordError(LocaleKeys.old_password_is_incorrect.tr()));
      return false;
    }
  }

  bool validatePassword(String password) {
    final String error =
        LocaleKeys.password_validate.tr();

    final bool result = TextValidator.isPasswordValid(password);
    result ? emit(UserInitial()) : emit(PasswordError(error));

    return result;
  }

  bool isRepeatedPasswords(String password1, String password2) {
    final String error = LocaleKeys.passwords_dont_match.tr();
    final bool result = password1 == password2;
    result ? emit(UserInitial()) : emit(PasswordError(error));

    return result;
  }
}
