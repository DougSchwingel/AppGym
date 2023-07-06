import 'package:flutter/material.dart';
import 'package:gym_app/Pages/loginpage.dart';
import 'package:gym_app/Pages/mainpage.dart';
import 'package:gym_app/Pages/reset_password.dart';
import 'package:gym_app/Pages/sig_in_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/MainPage': (context) => const MainPage(),
        '/SignInPage' :(context) => const SignInPage(),
        '/resPassw' :(context) => const ResetPassword(),
      },
    );
  }
}
