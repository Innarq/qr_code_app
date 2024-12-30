import 'package:flutter/material.dart';
import 'package:qr_code_app/screens/add_qr_form_screen.dart';
import 'package:qr_code_app/screens/qr_list_screen.dart';
import 'package:qr_code_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffE4E4E4),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/list': (context) => QrListScreen(),
        '/form': (context) => AddQrFormScreen(),
      },
    );
  }
}