import 'package:flutter/material.dart';
import 'package:jbtailors/pages/dashboard.dart';
import 'package:jbtailors/pages/register.dart';
import 'package:jbtailors/pages/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.red),
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade900),
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.blueGrey,
              ),
            ),
            themeMode: currentMode,
            home: const Register(),
          );
        });
  }
}
