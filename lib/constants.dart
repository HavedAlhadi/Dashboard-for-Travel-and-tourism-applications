import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/MethodConest.dart';
import 'package:kayan_controle/main.dart';

const double kPadding = 10.0;
bool DarkMode=false;
Color purpleLight = DarkMode==true? Color.fromARGB(255, 35, 32, 32): Color.fromARGB(255, 19, 49, 63);
 Color purpleDark = DarkMode==true? Color.fromARGB(255, 66, 49, 33):Color.fromARGB(255, 221, 237, 241);
 Color enabletextdark = Colors.white;
  Color disabletextledark = Colors.black54;
  Color orange = Color.fromARGB(255, 255, 154, 3);
  Color red = Color.fromARGB(255, 35, 32, 32);
  Color blue = Color.fromARGB(255, 16, 173, 209);

getThame(bool t)
{
  if(t)
  {
        purpleLight = Color.fromARGB(255, 35, 32, 32);
        purpleDark = Color.fromARGB(255, 66, 49, 33);
        enabletextdark = Colors.white;
        disabletextledark = Color.fromARGB(137, 32, 20, 20);
        orange = Color.fromARGB(255, 255, 154, 3);
        red = Color.fromARGB(255, 35, 32, 32);
        blue = Color.fromARGB(255, 16, 173, 209);
  }
  else
  {
        purpleLight = Color.fromARGB(255, 19, 49, 63);
        purpleDark = Color.fromARGB(255, 221, 237, 241);
        enabletextdark = Colors.black;
        disabletextledark = Color.fromARGB(255, 255, 255, 255);
        red = Color.fromARGB(255, 2, 122, 86);
        orange = Color.fromARGB(255, 54, 120, 244);
        blue = Color.fromARGB(255, 16, 173, 209);
  }

}

