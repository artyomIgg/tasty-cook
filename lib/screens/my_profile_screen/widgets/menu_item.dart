import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/app_state_cubit/app_state_cubit.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/screens/my_profile_screen/widgets/change_localization_dialog.dart';
import 'package:tasty_cook/screens/my_profile_screen/widgets/change_password_dialog.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static final List<MenuItem> firstItems = [pass, loc];
  static final List<MenuItem> secondItems = [logout];

  static final pass = MenuItem(text: LocaleKeys.change_password.tr(), icon: Icons.password);
  static final loc = MenuItem(text: LocaleKeys.localization.tr(), icon: Icons.language);
  static final logout = MenuItem(text: LocaleKeys.logout.tr(), icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    if(item == MenuItems.logout) {
      onLogout(context);
    } else if (item == MenuItems.pass) {
      _showPasswordDialog(context);
    } else if (item == MenuItems.loc) {
      _showLocalizationDialog(context);
    }
  }

  static Future<void> _showPasswordDialog(BuildContext context) async {
    await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      context: context,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        // dialogContext = context;
        return ChangePasswordDialog();
      },
    );
  }

  static Future<void> _showLocalizationDialog(BuildContext context) async {
    await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      context: context,
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        // dialogContext = context;
        return ChangeLocalizationDialog();
      },
    );
  }

  static Future<void> onLogout(BuildContext context) async {
    final AppStateCubit cubit = BlocProvider.of<AppStateCubit>(context);

    await cubit.logOut();
  }
}
