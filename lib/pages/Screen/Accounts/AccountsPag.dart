import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsCards.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsEditor.dart';

GlobalKey<AnimatedListState> akeyForAccount=GlobalKey<AnimatedListState>();
class AccountsContect extends StatefulWidget {
  const AccountsContect({Key? key}) : super(key: key);

  @override
  State<AccountsContect> createState() => AccountslistContectState();
}

class AccountslistContectState extends State<AccountsContect> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;
  var Scoll3=ScrollController();
  @override
   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
        Scoll3.animateTo(Scoll3.position.maxScrollExtent,
             duration: Duration(milliseconds: 3000), curve: Curves.easeOut);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
     screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;  
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: kPadding / 2,
                        left: kPadding / 2,
                        right: kPadding / 2),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          //  color: purpleLight,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: kPadding / 2 + 2,
                        right: kPadding / 2 + 2),
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(                        
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: AnimatedList(
                          reverse: true,
                          shrinkWrap: true,                          
                          key: akeyForAccount,
                          controller: Scoll3,
                          initialItemCount: Accountslist.length,
                          itemBuilder: (context, index,animation) {
                            return AnimatedContainer(
                                height: 90,
                                width: screenWidth,
                                curve: Curves.easeInOutBack,
                                duration: Duration(milliseconds: 300 + (index * 300)),
                                transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),                         
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: Offset(0, 0),
                                ).animate(CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.decelerate,
                                    reverseCurve: Curves.fastOutSlowIn)),
                              child: RotationTransition(
                                turns: animation,
                                child: SizeTransition(
                                  axis: Axis.vertical,
                                  sizeFactor: animation,
                                  child:AccountsContectCard(
                                indexs: index,
                                sero: Accountslist[index],
                                press: () {                                
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EdetorAccounts(
                                              index: index,
                                              id: Accountslist[index].id,
                                              nameAcco: Accountslist[index].name,
                                              Enable:  Accountslist[index].enable,
                                              image:  Accountslist[index].image,
                                              link:  Accountslist[index].link,
                                              ))).then((value) => setState(() {}));                                                                                                                                                                               
                                },
                              ))),
                            ));
                          }),
                    ),
                  ),
                ],
              )),
            ],
          ),
          Positioned(
            bottom: 17,
            left: 16,
            child: InkWell(
              child: Container(
                width: kPadding * 5.5,
                height: kPadding * 5.5,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(-1, 5),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ],
                  color: purpleLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Icon(
                  Icons.add_link,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EdetorAccounts(
                          index: Accountslist.length,
                          id: "",
                                            nameAcco: "",
                                            Enable:  true,
                                            image:  "",
                                            link:  "",
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
