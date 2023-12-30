import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/Thame.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Customers/SearchCust.dart';
import 'package:kayan_controle/pages/Screen/ProgramerInfo.dart';
import 'package:kayan_controle/pages/widgets/splash_page.dart';
import 'package:kayan_controle/widget_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp(){getBool();}
  getBool() async
  {
    
    SharedPreferences sharad=
     await SharedPreferences.getInstance();
        DarkMode=sharad.getBool("Mode")!;            
  }
  getData()async{
    try
    {
    await FirebaseFirestore.instance.collection("StoryAds").get().then((element) {
      element.docs.forEach((element) {
        Story s=new Story(Id: element.get("id"),index:element.get("index"),img: element.get("image"), name: element.get("title"));        
        Mstories.add(s);     
      });
    });
     await FirebaseFirestore.instance.collection("Customers").get().then((element) {
      element.docs.forEach((element) {
        Customer Cust=new Customer(id: element.get("Id"), name: element.get("NameCust"),
         numberPhone:element.get("numberPhone"), numPassport: element.get("numPassport"), ImageTrans: element.get("ImageTrans"), StatusTrans: element.get("StatusTrans"),
          TypeTrans: element.get("TypeTrans"), NumberTrans: element.get("NumberTrans"), DateTrans: element.get("DateTrans"));        
        CustomersListItem.add(Cust);     
      });
    });
    await FirebaseFirestore.instance.collection("OurAccounts").get().then((element) {
      element.docs.forEach((element) {
        Accounts_ Acco=new Accounts_(id: element.get("Id"), name: element.get("Name"),
         link:element.get("Link"), enable: element.get("Enable"), image: element.get("Image"),);        
        Accountslist.add(Acco);     
      });
    });
    await FirebaseFirestore.instance.collection("MessTabl").get().then((element) {
      element.docs.forEach((element) {
        MessTabl Messages=new MessTabl(id: element.get("Id"), Contant: element.get("Contant"),
         numberReceive:element.get("numberReceive"),  timeSend: element.get("timeSend"),);        
        TableMessages.add(Messages);                     
      });
    });
    await FirebaseFirestore.instance.collection("Receives").get().then((element) {
      element.docs.forEach((element) {
        Received Rec=new Received(id: element.get("Id"), name: element.get("name"),
         lastMassag:element.get("lastMassag"),  number: element.get("number"),);        
        ListUser.add(Rec);                     
      });
    });
     await FirebaseFirestore.instance.collection("DataHomePage").get().then((element) {
      element.docs.forEach((element) {        
        InterfaceControlslist[0].TotalU=element.get("TotalUsers"); 
        InterfaceControlslist[0].TotaSelsct=element.get("TotaSelsct");        
          InterfaceControlslist[0].enableDark=element.get("DarkMode");
          InterfaceControlslist[0].enableSelect=element.get("EnableSelecte");
      });            
    }).then((value) =>  getThame(DarkMode));    
    }
    catch(es){}
  }  

  

  @override  
  Widget build(BuildContext context) {        
     DarkMode==false?
     Get.changeTheme(MyThame.lightThemeData(context)):
     Get.changeTheme(MyThame.darkThemeData(context));       
     getThame(DarkMode);
    return GetMaterialApp(      
      //Delete Mark flutter
      debugShowCheckedModeBanner: false,
      title: 'مؤسسة كيان',       
      theme:    
      ThemeData(
          textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
     ),
      home:  Directionality(textDirection: TextDirection.rtl, child: SplashPage()),
          routes: {
            "Splash":(context)=>SplashPage(),
            "Home":(context)=>WidgetTree(indexPageClick: 0),
            "Customers":(context)=>WidgetTree(indexPageClick: 1),
            "Accont":(context)=> WidgetTree(indexPageClick: 2),
            "Chat":(context) => WidgetTree(indexPageClick: 3),
            "Haved":(context) => Myinfopro(),
            "Search":(context) => SearchBarScreen(),
          },
    );
  }
}

