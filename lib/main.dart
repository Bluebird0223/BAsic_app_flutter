import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/route.dart';
import 'pages/home_page.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: Myroutes.homeRoute,
      routes: {
        '/': (context) => LoginPage(),
        Myroutes.homeRoute: (context) => HomePage(),
        Myroutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}

 

// 4:57:40 ----->gridView

