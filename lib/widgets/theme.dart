import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
   static ThemeData lightTheme(BuildContext context) =>(
      ThemeData(primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme:  const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0)

        )
        //primaryTextTheme: GoogleFonts.latoTextTheme()
      )
  );

   static ThemeData darkTheme(BuildContext context) =>(
       ThemeData(
         brightness: Brightness.dark,
       )
   );

   static Color creamswhite=Color(0xfff5f5f5);
   static Color darkBluishColor = Color(0xff403b58);


}