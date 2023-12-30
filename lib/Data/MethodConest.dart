import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/widgets/AnimatedLode.dart';
import 'package:shared_preferences/shared_preferences.dart';


 //رسالة التاكد من الحذف 
Future<void> ShowAlertdialog(context,Function function,String Name) async{
  return showDialog(context: context,barrierDismissible: true, builder: (context){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
                  side: BorderSide(color: enabletextdark),
                  borderRadius: BorderRadius.circular(50),
                ),
        backgroundColor: purpleDark,
        title: Text("تنبيه",style: TextStyle(fontSize: 20,color: orange),),
        content: Text("هل تريد بالتاكيذ حذف ${Name}؟ ",style: TextStyle(fontSize: 15,color: enabletextdark),) ,
        actions: <Widget>[
          TextButton(onPressed:() {
            function();
            var snakbar=SnackBar(content: Text("تم الحذف بنجاح"),
                      duration: Duration(seconds: 3),
                      backgroundColor: Color.fromARGB(255, 1, 177, 51),
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10));
                      ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      Navigator.pop(context);
          }, child: Text("نعم",style: TextStyle(fontSize: 19,color: orange))),
           SizedBox(),
           TextButton(onPressed:() {
            Navigator.pop(context);
           }, child: Text("لا",style: TextStyle(fontSize: 20,color: orange)))
        ],
      ),
    );
  });
}


//دالة اشعار التوضيح
void ShowMySnakbar(BuildContext context,String ContantText,Color Bg)
{ var snakbar=SnackBar(content: Text(ContantText,style: TextStyle(color: Colors.white),textDirection: TextDirection.rtl,),
                    duration: Duration(milliseconds: 1000),
                    backgroundColor: Bg,
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10));
                    ScaffoldMessenger.of(context).showSnackBar(snakbar);
}
 
 
//Appbar Widow edite
AppBar AppBars(BuildContext context,final function) {
    return AppBar(
      title: Text(
        "رجوع",
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: purpleLight,
      elevation: 0,
      actions:[ IconButton(
        padding: EdgeInsets.only(left: 10),
        icon: Padding(
          padding: const EdgeInsets.only(left: kPadding),
          child: Icon(
            Icons.done,
            color: orange,
            size: 30,
          ),
        ),
        onPressed: function,
      ),],
      
    );
  }



//فحص الانترنت
  checkConnection() async {
  try {   
    final result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } 
    else {
      //print("not connect");
      return false;
    }
  } on SocketException catch (_) {
    //print("not connect");
    return false;
  }
}


  Future<bool> getBool() async
  {
    bool d;
    try
    {
    SharedPreferences sharad=
     await SharedPreferences.getInstance();
     d=sharad.getBool('Mode')!;
        return d;                  
    }
    catch(es){
      return false;
      //  print(DarkMode.toString()+"dsf");
    }  
    return false;
  }


