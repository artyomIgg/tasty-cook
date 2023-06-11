import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/widgets/main_button.dart';

class ChangeLocalizationDialog extends StatefulWidget {
  const ChangeLocalizationDialog({
    super.key,
  });

  @override
  State<ChangeLocalizationDialog> createState() =>
      _ChangeLocalizationDialogState();
}

class _ChangeLocalizationDialogState extends State<ChangeLocalizationDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Material(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                            onPressed: () => setLocale(Locale('en', 'US')),
                            child: Text(LocaleKeys.english.tr())),
                        TextButton(
                            onPressed: () => setLocale(Locale('uk', 'UA')),
                            child: Text(LocaleKeys.ukrainian.tr())),
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MainButton(
                              onPressed: onTapClose,
                              text: LocaleKeys.close.tr(),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 16,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onTapClose() {
    Navigator.of(context).pop();
  }

  void setLocale(Locale locale) {
    context.setLocale(locale);
  }
}
