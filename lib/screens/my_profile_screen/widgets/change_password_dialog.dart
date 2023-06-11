import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/user_cubit/user_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/widgets/main_button.dart';
import 'package:tasty_cook/widgets/my_loader.dart';
import 'package:tasty_cook/widgets/text_fields/my_text_filed.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({
    super.key,
  });

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final TextEditingController oldPass = TextEditingController();
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  late final FocusNode _nameFocusNode;

  bool isDisableApply = false;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();

    // nameController.addListener(() {
    //   if (nameController.value.text.isEmpty) {
    //     setState(() {
    //       isDisableApply = true;
    //     });
    //   } else {
    //     setState(() {
    //       isDisableApply = false;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _nameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IgnorePointer(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    top: (constraints.maxHeight / 2) -
                        260, // Adjust the value to fit your needs
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        width: size.width * 0.9,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Material(
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                LocaleKeys.change_password.tr(),
                                style: constants.Styles.title18.copyWith(
                                    color: constants.Colors.secondaryBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                child: SizedBox(
                                  width: 260,
                                  height: 40,
                                  child: MyTextField(
                                    hintText: LocaleKeys.old_password.tr(),
                                    controller: oldPass,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                child: SizedBox(
                                  width: 260,
                                  height: 40,
                                  child: MyTextField(
                                    hintText: LocaleKeys.new_password.tr(),
                                    controller: pass1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                child: SizedBox(
                                  width: 260,
                                  height: 40,
                                  child: MyTextField(
                                    hintText:
                                        LocaleKeys.confirm_new_password.tr(),
                                    controller: pass2,
                                  ),
                                ),
                              ),
                              if (state is PasswordError) ...[
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  state.error,
                                  style: constants.Styles.error,
                                  textAlign: TextAlign.center,
                                ),
                              ],

                              const SizedBox(
                                height: 16,
                              ),
                              state is PasswordLoading
                                  ? const Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const MyLoader(),
                                    )
                                  : SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MainButton(
                                          onPressed: () async => onTap(context),
                                          text: LocaleKeys.change_password.tr(),
                                        ),
                                      ),
                                    ),
                              // const SizedBox(height: 16,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> onTap(BuildContext context) async {
    final UserCubit cubit = BlocProvider.of<UserCubit>(context);
    final String oldPass = this.oldPass.text;
    final String newPassword1 = pass1.text;
    final String newPassword2 = pass2.text;

    final isSuccess =
        await cubit.changePassword(oldPass, newPassword1, newPassword2);

    if (isSuccess) {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            LocaleKeys.password_changed_successfully.tr(),
            style: constants.Styles.textSmallGold,
          ),
        ),
      );
    }
  }

  void onTapClose() {
    Navigator.of(context).pop();
  }
}
