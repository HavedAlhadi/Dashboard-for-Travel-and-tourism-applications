import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsPag.dart';
import 'package:kayan_controle/pages/Screen/Chat/chats.dart';
import 'package:kayan_controle/pages/Screen/Customers/Customers.dart';
import 'package:kayan_controle/pages/drawer/drawer_page.dart';
import 'package:kayan_controle/pages/Screen/HomePag.dart';
import 'package:kayan_controle/responsive_layout.dart';
import 'package:flutter/material.dart';

int ActivePage = 0;
class WidgetTree extends StatefulWidget {
  final int indexPageClick;
  const WidgetTree({Key? key, required this.indexPageClick}) : super(key: key);
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree>
    with SingleTickerProviderStateMixin {    
  late TabController myController;  
    void initState() {
      setState(() {
        getThame(DarkMode);
        });
      // getData();
    ActivePage = widget.indexPageClick;
    myController =
        new TabController(length: 4, vsync: this, initialIndex: ActivePage);
    super.initState();
  }
  int currentIndex = 1;
  List<Tab> Mytap = [
    Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text(
          "الرئيسية",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text("العملاء",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Text(
          "الحسابات",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ),
    Tab(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "الدرداشة",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "لوحة التحكم",
            textAlign: TextAlign.start,
            style: TextStyle( color: Colors.white),
          ),
          toolbarHeight: 80,
          backgroundColor: purpleLight,
          actions:[
           Padding(
             padding: const EdgeInsets.all(15),
             child: IconButton(icon: Icon(Icons.search,size: 28,color: Colors.white,),onPressed: ()=> Navigator.of(context).pushNamed("Search")),
           ),
          ],
          bottom: TabBar(
            isScrollable: true,          
            controller: myController,
            tabs: Mytap,
            onTap: (index) {
              try{
              setState(() {
                ActivePage = index;
              });
              } catch(ex){}
            },
          ),
        ),
        //     PreferredSize(
        //   preferredSize: Size(double.infinity, 100),
        //   child: (ResponsiveLayout.isTinyLimit(context) ||
        //           ResponsiveLayout.isTinyHeightLimit(context))
        //       ? Container()
        //       : AppBarWidget(),
        // ),
        body: ResponsiveLayout(
          tiny: Container(),
          phone: TabBarView(controller: myController, children: [
            PanelLeftPage(),
            CustomerContect(),
            AccountsContect(),
            HomeChatsPag(),
          ]),
          tablet: Row(
            children: [
              Expanded(child: PanelLeftPage()),
              Expanded(
                child: Container(),
              )
            ],
          ),
          largeTablet: TabBarView(
            controller: myController,
            children: [            
              Row(
                children: [
                  Expanded(
                      child: DrawerPage(
                    i: ActivePage,
                  )),
                  Expanded(child: Container()),
                  Expanded(child: CustomerContect())
                ],
              ),
              Container(
                child: Text("sdfsfd"),
              ),
              Container(),
              Container(),
            ],
          ),
          computer:Row(
                children: [
                  Expanded(child: PanelLeftPage()),
                  Expanded(child: CustomerContect()),
                  Expanded(child:  AccountsContect()),
                  Expanded(child: HomeChatsPag())
                ],
              ),               
        ),
        drawer: DrawerPage(i: ActivePage),
      ),
    );
  }
}

// Widget AppBarPhone() {
//   return Scaffold(
//     appBar: AppBar(
//       bottom: TabBar(tabs: [
//         tab(chel)
//       ]),
//     ),
//   );
// }
