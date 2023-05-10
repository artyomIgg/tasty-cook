import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/bloc/sign_in_cubit.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/widgets/logo_widget.dart';
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

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
                child: _content(),
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

  Widget _content() {
    const double textFieldHeight = 40;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Sign In',
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
                        hintText: 'Email',
                        style: constants.Styles.textFieldBlack,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: textFieldHeight,
                      child: MyTextField(
                        controller: _passwordEditingController,
                        hintText: 'Password',
                        style: constants.Styles.textFieldBlack,
                      ),
                    ),
                    if (state is SignInError) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(state.error, style: constants.Styles.error,),
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: MainButton(
                        text: 'Sign In',
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
            '- OR -',
            style: constants.Styles.textFieldWhite,
          ),
          const SizedBox(
            height: 10,
          ),
          SignInButton(Buttons.Google, onPressed: () => null),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot your password?',
              style: constants.Styles.textSmallWhite,
            ),
            const SizedBox(
              width: 6,
            ),
            CupertinoButton(
              onPressed: () => context.router.push(const ResetPasswordRoute()),
              padding: EdgeInsets.zero,
              child: Text(
                'Reset password',
                style: constants.Styles.textSmallGold,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
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
                'Sign Up',
                style: constants.Styles.textSmallGold,
              ),
            )
          ],
        ),
      ],
    );
  }

  void _onSignIn(BuildContext context) {
    final String email = _emailEditingController.text;
    final String password = _passwordEditingController.text;

    final SignInCubit activationCodeCubit =
    BlocProvider.of<SignInCubit>(context);

    activationCodeCubit.signIn(email, password);
  }
}
