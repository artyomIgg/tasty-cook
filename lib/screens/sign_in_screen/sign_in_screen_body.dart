import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:tasty_cook/bloc/user_cubit/user_cubit.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/widgets/logo_widget.dart';
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/text_fields/passwrod_text_field.dart';

class SignInScreenBody extends StatelessWidget {
  SignInScreenBody({super.key});

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.Colors.primaryGrey,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              _logoWidget(),
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 20,
                child: _content(context),
              ),
              _footer(context),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            LocaleKeys.sign_in.tr(),
            style: constants.Styles.title,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return Container(
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
                        controller: _emailEditingController,
                        hintText: LocaleKeys.email.tr(),
                        style: constants.Styles.textFieldBlack,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      child: PasswordTextField(
                        controller: _passwordEditingController,
                      ),
                    ),
                    if (state is SignInError) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.error,
                        style: constants.Styles.error,
                      ),
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: state is SignInLoading
                          ? const MyLoader()
                          : MainButton(
                              text: LocaleKeys.sign_in.tr(),
                              onPressed: () => _onSignIn(context),
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '- ${LocaleKeys.or.tr()} -',
            style: constants.Styles.textFieldWhite,
          ),
          const SizedBox(
            height: 10,
          ),
          SignInButton(Buttons.Google,
              onPressed: () => _onGoogleSignIn(context)),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       LocaleKeys.forgot_password.tr(),
        //       style: constants.Styles.textSmallWhite,
        //     ),
        //     const SizedBox(
        //       width: 6,
        //     ),
        //     CupertinoButton(
        //       onPressed: () => context.router.push(const ResetPasswordRoute()),
        //       padding: EdgeInsets.zero,
        //       child: Text(
        //         LocaleKeys.reset_password.tr(),
        //         style: constants.Styles.textSmallGold,
        //       ),
        //     )
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.dont_have_account.tr(),
              style: constants.Styles.textSmallWhite,
            ),
            const SizedBox(
              width: 6,
            ),
            CupertinoButton(
              onPressed: () => context.router.push(const SignUpRoute()),
              // onPressed: null,
              padding: EdgeInsets.zero,
              child: Text(
                LocaleKeys.sign_up.tr(),
                style: constants.Styles.textSmallGold,
              ),
            )
          ],
        ),
      ],
    );
  }

  Future _onSignIn(BuildContext context) async {
    final String email = _emailEditingController.text;
    final String password = _passwordEditingController.text;

    final SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);

    final bool isSignIn = await signInCubit.signIn(email, password);

    //TODO
    if (isSignIn) {
      final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
      await userCubit.getUserFormApi();

      await context.router.replace(MainRoute());
    }
  }

  Future _onGoogleSignIn(BuildContext context) async {
    final SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);

    final bool isSignIn = await signInCubit.googleSignIn();

    if (isSignIn) {
      final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
      await userCubit.getUserFormApi();

      await context.router.replace(MainRoute());
    }
  }
}
