import 'package:flutter/material.dart';
import 'package:notevia/controller/global_setting_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<GlobalSettingProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider =
            Provider.of<GlobalSettingProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      activeColor: Colors.cyan,
    );
  }
}
