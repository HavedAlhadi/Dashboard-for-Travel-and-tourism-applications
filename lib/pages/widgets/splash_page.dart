import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/Thame.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/widget_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  getBool() async {
    try {
      SharedPreferences sharad = await SharedPreferences.getInstance();
      setState(() {
        DarkMode = sharad.getBool('Mode')!;
      });
    } catch (es) {
      //  print(DarkMode.toString()+"dsf");
    }
  }

  getData() async {
    try {
      await FirebaseFirestore.instance
          .collection("StoryAds")
          .get()
          .then((element) {
        element.docs.forEach((element) {
          Story s = new Story(
              Id: element.get("id"),
              index: element.get("index"),
              img: element.get("image"),
              name: element.get("title"));
          Mstories.add(s);
        });
      });
      await FirebaseFirestore.instance
          .collection("Customers")
          .get()
          .then((element) {
        element.docs.forEach((element) {
          Customer Cust = new Customer(
              id: element.get("Id"),
              name: element.get("NameCust"),
              numberPhone: element.get("numberPhone"),
              numPassport: element.get("numPassport"),
              ImageTrans: element.get("ImageTrans"),
              StatusTrans: element.get("StatusTrans"),
              TypeTrans: element.get("TypeTrans"),
              NumberTrans: element.get("NumberTrans"),
              DateTrans: element.get("DateTrans"));
          CustomersListItem.add(Cust);
        });
      });
      await FirebaseFirestore.instance
          .collection("OurAccounts")
          .get()
          .then((element) {
        element.docs.forEach((element) {
          Accounts_ Acco = new Accounts_(
            id: element.get("Id"),
            name: element.get("Name"),
            link: element.get("Link"),
            enable: element.get("Enable"),
            image: element.get("Image"),
          );
          Accountslist.add(Acco);
        });
      });
      await FirebaseFirestore.instance
          .collection("MessTabl")
          .get()
          .then((element) {
        element.docs.forEach((element) {
          MessTabl Messages = new MessTabl(
            id: element.get("Id"),
            Contant: element.get("Contant"),
            numberReceive: element.get("numberReceive"),
            timeSend: element.get("timeSend"),
          );
          TableMessages.add(Messages);
        });
      });
      await FirebaseFirestore.instance
          .collection("Receives")
          .get()
          .then((element) {
        element.docs.forEach((element) {
          Received Rec = new Received(
            id: element.get("Id"),
            name: element.get("name"),
            lastMassag: element.get("lastMassag"),
            number: element.get("number"),
          );
          ListUser.add(Rec);
        });
      });
      await FirebaseFirestore.instance
          .collection("DataHomePage")
          .get()
          .then((element) {
        element.docs.forEach((element) {
          InterfaceControlslist[0].TotalU = element.get("TotalUsers");
          InterfaceControlslist[0].TotaSelsct = element.get("TotaSelsct");
          InterfaceControlslist[0].enableDark = element.get("DarkMode");
          InterfaceControlslist[0].enableSelect = element.get("EnableSelecte");
        });
      }).then((value) => getThame(DarkMode));
    } catch (es) {}
  }

  @override
  void initState() {
    //getData();
    getBool();
    setState(() {
      getThame(DarkMode);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 25),
          const Text(
            'أنجز معاملتك معنا',
            style: TextStyle(
              fontSize: 22.0,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'كيان سرعة وأمان',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 450,
            width: 450,
            child: Image.asset('images/lcon.png'),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              setState(() {
                (DarkMode != true)
                    ? Get.changeTheme(MyThame.lightThemeData(context))
                    : Get.changeTheme(MyThame.darkThemeData(context));
                getThame(DarkMode);
              });

              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Directionality(
                    textDirection: TextDirection.rtl,
                    child: WidgetTree(
                      indexPageClick: 0,
                    ));
              }));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'دخول',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'فريق التطوير',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'جميع الخقوق محفوظة لدى كيان لسفريات@',
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
