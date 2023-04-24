import 'package:banana_challenge_app/l10n/l10n.dart';
import 'package:banana_challenge_app/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Resize(
      builder: () {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF9E007E)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF9E007E),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const LoginPage(),
        );
      },
    );
  }
}
