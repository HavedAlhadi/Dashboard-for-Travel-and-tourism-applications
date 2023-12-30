import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/constants.dart';
import 'package:path/path.dart';



class MyThame{

static ThemeData lightThemeData(BuildContext context) {  
  getThame(false);
  return ThemeData.light().copyWith(    
    primaryColor:  Color.fromARGB(255, 221, 237, 241),
    scaffoldBackgroundColor: Color.fromARGB(255, 221, 237, 241),
    appBarTheme: AppBarTheme( 
          iconTheme: IconThemeData(color:  Color.fromARGB(255, 221, 237, 241))
     ),
    backgroundColor: Color.fromARGB(255, 221, 237, 241),
    brightness: Brightness.light,    
    iconTheme: IconThemeData(color:  enabletextdark),
    textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme).apply(bodyColor: enabletextdark),
    colorScheme: ColorScheme.light().copyWith(
      primary: Color.fromARGB(255, 221, 237, 241),
      secondary: Color.fromARGB(255, 221, 237, 241),
      error: disabletextledark,
    ),
  );
}


 
static ThemeData darkThemeData(BuildContext context) {
  getThame(true);
  return ThemeData.dark().copyWith(
    primaryColorDark:  Color.fromARGB(255, 66, 49, 33),
    scaffoldBackgroundColor: Color.fromARGB(255, 66, 49, 33),
    appBarTheme: appBarTheme,    
    backgroundColor: Color.fromARGB(255, 66, 49, 33),
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color:  enabletextdark),
    textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme).apply(bodyColor: enabletextdark),
    colorScheme: ColorScheme.dark().copyWith(
      primary:  Color.fromARGB(255, 66, 49, 33),
      secondary:   Color.fromARGB(255, 66, 49, 33),
      //error: disabletextledark,
    ),
  );
}


}


final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);