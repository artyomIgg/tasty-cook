import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasty_cook/services/database_service/database_service.dart';
import 'package:tasty_cook/utils/app_state/app_state.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(TokenInitial());

  Future<void> saveToken(String token) async {
    await DatabaseService().saveToken(token);
  }

  Future<String> getToken() async {
    final String? token = await DatabaseService().getToken();

    if(token != null) {
      AppState.token = token;
      return token;
    } else {
      return '';
    }
  }
}
