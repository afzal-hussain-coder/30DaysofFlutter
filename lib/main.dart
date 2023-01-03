import 'package:flutter/material.dart';
import 'package:flutter_new_project/pages/home_page.dart';
import 'package:flutter_new_project/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int days=30;
    // String name ="Afzal Hussain";
    // double pi = 3.14;
    // bool isMale = false;
    // num tem = 30.0;
    // var day ="Monday";
    // const pii = 3.14;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.purple,
      fontFamily: GoogleFonts.lato().fontFamily,
      //primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
         "/": (context) => HomePage(),
        "/login": (context) =>LoginPage()
      },
    );
  }
}
