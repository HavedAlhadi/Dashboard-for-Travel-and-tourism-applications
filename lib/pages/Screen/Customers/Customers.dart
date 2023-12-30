import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersCard.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersEdite.dart';
import '../../../Data/Data.dart';
import 'package:intl/intl.dart';
GlobalKey<AnimatedListState> akeyForCustomer=GlobalKey<AnimatedListState>();
class CustomerContect extends StatefulWidget {
  const CustomerContect({Key? key}) : super(key: key);
  @override
  State<CustomerContect> createState() => _CustomerContectState();
}
String getDateNow(DateTime d)
  {
    var now = d;
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
  
class _CustomerContectState extends State<CustomerContect> {
ScrollController Scoll2=ScrollController();
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;
  @override
   void initState() {
    super.initState();    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
        try
        {
        Scoll2.animateTo(Scoll2.position.maxScrollExtent,
             duration: Duration(milliseconds: 4000), curve: Curves.easeInOutCubic);
        }
            catch(es){}
      });
    });
  }
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
                      margin: EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: 
                      CustomersListItem.isNotEmpty?
                       AnimatedList(                                                    
                          reverse: true,
                          shrinkWrap:true,                                                   
                          key: akeyForCustomer,
                          controller: Scoll2,
                          initialItemCount: CustomersListItem.length,
                          itemBuilder: (context, index,animation) {
                            return AnimatedContainer(
                                height: 90,
                                width: screenWidth,
                                curve: Curves.easeInOut,
                                duration: Duration(milliseconds: 300 + (index * 200)),
                                transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),                         
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: Offset(0, 0),
                                ).animate(CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    reverseCurve: Curves.fastLinearToSlowEaseIn)),
                                child: CustomerContectCard(
                                  color: purpleDark,
                                  indexs: index,
                                  sero: CustomersListItem[index],
                                  press: () {
                                    print(CustomersListItem.length.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ParnterEdetor(
                                              id:CustomersListItem[index].id,
                                              index: index,
                                              name: CustomersListItem[index].name,
                                              numberPhone: CustomersListItem[index].numberPhone,
                                              numPassport: CustomersListItem[index].numPassport,
                                              ImageTrans: CustomersListItem[index].ImageTrans,
                                              DateTrans: CustomersListItem[index].DateTrans,
                                              NumberTrans: CustomersListItem[index].NumberTrans,
                                              StatusTrans: CustomersListItem[index].StatusTrans,
                                              TypeTrans: CustomersListItem[index].TypeTrans))).then((value) => setState(() {}));
                                  },
                                ),
                              ),
                            );
                          }):Center(
                                child: Text("ليس هناك عملاء للتو ...",style: TextStyle(color: enabletextdark, fontSize: 20,fontWeight: FontWeight.w700),),
                              ),
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
                  Icons.person_add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ParnterEdetor(
                        id:"",
                        index:CustomersListItem.length,
                        name: "",
                        numberPhone: "",
                        numPassport: "",
                        ImageTrans: "", DateTrans: getDateNow(new DateTime.now()),
                        NumberTrans: "", StatusTrans: "",
                        TypeTrans: "")));
              },
            ),
          ),
        ],
      ),
      
    );
  }
}

