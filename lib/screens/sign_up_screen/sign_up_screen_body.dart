import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/widgets/logo_widget.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Sign Up',
            style: constants.Styles.title,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    hintText: 'Username',
                    style: constants.Styles.textFieldBlack,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: textFieldHeight,
                  child: MyTextField(
                    hintText: 'Password',
                    style: constants.Styles.textFieldBlack,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: textFieldHeight,
                  child: MyTextField(
                    hintText: 'Repeat password',
                    style: constants.Styles.textFieldBlack,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: MainButton(
                    text: 'Sign Up',
                    onPressed: null,
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
              text: 'Back',
              onPressed: () => context.router.pop(),
            ),
          ),
        ],
      ),
    );
  }
}
