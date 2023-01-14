import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemeData {
   static ThemeData lightTheme(BuildContext context) =>(
      ThemeData(primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.white,
          canvasColor: creamswhite,
          buttonColor: darkBluishColor,
        accentColor: darkBluishColor,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.black,
          contentTextStyle: TextStyle(color: Colors.white)
        ),
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
           fontFamily: GoogleFonts.poppins().fontFamily,
           cardColor: Colors.black,
           canvasColor: darkCreamColor,
           buttonColor: lightBluishColor,
           accentColor: Colors.white,
         snackBarTheme: SnackBarThemeData(
             backgroundColor: Colors.white,
             contentTextStyle: TextStyle(color: Colors.black)
         ),
           appBarTheme:  const AppBarTheme(
               elevation: 0.0,
               backgroundColor: Colors.black,
               iconTheme: IconThemeData(color: Colors.white),
               titleTextStyle: TextStyle(color: Colors.white,fontSize: 20.0),

       )
   )
   );

   static Color creamswhite=Color(0xfff5f5f5);
   static Color darkCreamColor = Vx.gray900;
   static Color darkBluishColor = Color(0xff403b58);
   static Color lightBluishColor = Vx.indigo500;


}