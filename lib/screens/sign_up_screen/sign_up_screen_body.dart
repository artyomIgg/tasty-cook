import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/widgets/logo_widget.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';
import 'package:tasty_cook/widgets/text_fields/passwrod_text_field.dart';

class SignUpScreenBody extends StatelessWidget {
  SignUpScreenBody({super.key});

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _usernameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _repeatedPasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.Colors.primaryGrey,
      alignment: Alignment.center,
      // width: 100.w,
      // height: 100.h,
      child: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(child: SizedBox()),
              _logoWidget(),
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 100,
                child: _content(context),
              ),
              // const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Transform.scale(
      scale: 0.8,
      child: const LogoWidget(),
    );
  }

  Widget _content(BuildContext context) {
    const double textFieldHeight = 40;

    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                LocaleKeys.sign_up.tr(),
                style: constants.Styles.title,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: textFieldHeight,
                      child: MyTextField(
                        controller: _emailTextEditingController,
                        hintText: LocaleKeys.email.tr(),
                        style: constants.Styles.textFieldBlack,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    if (state is SignUpCheckError &&
                        state.emailError.isNotEmpty) ...[
                      Text(
                        state.emailError,
                        style: constants.Styles.errorSmall,
                      )
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      child: MyTextField(
                        controller: _usernameTextEditingController,
                        hintText: LocaleKeys.username.tr(),
                        style: constants.Styles.textFieldBlack,
                      ),
                    ),
                    if (state is SignUpCheckError &&
                        state.usernameError.isNotEmpty) ...[
                      Text(
                        state.usernameError,
                        style: constants.Styles.errorSmall,
                      )
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      child: PasswordTextField(
                        controller: _passwordTextEditingController,
                      ),
                    ),
                    if (state is SignUpCheckError &&
                        state.passwordError.isNotEmpty) ...[
                      Text(
                        state.passwordError,
                        style: constants.Styles.errorSmall,
                      )
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      child: PasswordTextField(
                        controller: _repeatedPasswordTextEditingController,
                        isRepeatPassword: true,
                      ),
                    ),
                    if (state is SignUpCheckError &&
                        state.repeatedPasswordError.isNotEmpty) ...[
                      Text(
                        state.repeatedPasswordError,
                        style: constants.Styles.errorSmall,
                      )
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    state is SignUpLoading ? const MyLoader() : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: MainButton(
                        text: LocaleKeys.sign_up.tr(),
                        onPressed: () => _onSignUp(context),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: MainButton(
                  text: LocaleKeys.back.tr(),
                  onPressed: () => _onBack(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onBack(BuildContext context) {
    final SignInCubit cubit = BlocProvider.of<SignInCubit>(context);

    cubit.restartCubit();

    context.router.pop();
  }

  Future<void> _onSignUp(BuildContext context) async {
    final String email = _emailTextEditingController.text;
    final String password = _passwordTextEditingController.text;
    final String username = _usernameTextEditingController.text;
    final String repeatedPassword = _repeatedPasswordTextEditingController.text;

    final SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);

    final bool isSignUp = await signInCubit.signUp(
      email: email,
      username: username,
      password: password,
      repeatedPassword: repeatedPassword,
    );

    if (isSignUp) {
      context.router.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            LocaleKeys.account_successfully_created.tr(),
            style: constants.Styles.textSmallGold,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            signInCubit.state is SignUpError
                ? (signInCubit.state as SignUpError).error
                : LocaleKeys.something_went_wrong.tr(),
            style: constants.Styles.textSmallGold,
          ),
        ),
      );
    }
  }
}
