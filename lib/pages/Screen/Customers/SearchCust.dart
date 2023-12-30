import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersCard.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersEdite.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
   double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;  
   List<Customer> CustomersListFound =[];
 void runFilter(String enteredKeyword) {
    List<Customer> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = CustomersListItem;
    } else {
      results = CustomersListItem
          .where((Cust) =>
              Cust.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    // Refresh the UI
    setState(() {      
      CustomersListFound = results;
    });        
  }

  
  @override
   void initState() {
    super.initState();
    CustomersListFound=CustomersListItem;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
        
      });
    });
  }
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;  
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: purpleLight,
        appBar: AppBar(
          leading: Spacer(),
          actions:[
             Padding(
               padding: const EdgeInsets.all(15),
               child: IconButton(icon: Icon(Icons.close),onPressed: ()=>Navigator.of(context).pop()),
             ),
          ],        
          elevation: 0,
          backgroundColor: purpleLight,                
        ),
        body: Column(        
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.bottomRight,
            child: 
            Text("الإستعلام عن المعاملة",textAlign: TextAlign.start,style: TextStyle(color: Colors.white54, fontSize: 20,fontWeight: FontWeight.w700),)),
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
            child: Container(
              height: 42,          
              child: TextField(
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                onChanged: (value) => runFilter(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                  hintText: "Search Customers"
                ),
              ),
            ),
          ),
    
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: 
                CustomersListFound.isNotEmpty?
                ListView.builder(
                          itemCount: CustomersListFound.length,                      
                          itemBuilder: (context, index) => AnimatedContainer(
                                    height: 90,
                                    width: screenWidth,
                                    curve: Curves.easeInOut,
                                    duration: Duration(milliseconds: 300 + (index * 200)),
                                    transform: Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),                         
                                  child: 
                                    CustomerContectCard(
                                      color: Colors.black45,
                                      
                                        indexs: index,
                                        sero: CustomersListFound[index],
                                        press: () {                                      
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ParnterEdetor(
                                                    id:CustomersListFound[index].id,
                                                    index: index,
                                                    name: CustomersListFound[index].name,
                                                    numberPhone: CustomersListFound[index].numberPhone,
                                                    numPassport: CustomersListFound[index].numPassport,
                                                    ImageTrans: CustomersListFound[index].ImageTrans,
                                                    DateTrans: CustomersListFound[index].DateTrans,
                                                    NumberTrans: CustomersListFound[index].NumberTrans,
                                                    StatusTrans: CustomersListFound[index].StatusTrans,
                                                    TypeTrans: CustomersListFound[index].TypeTrans))).then((value) => setState(() {}));
                                        },
                                      ),
                          ),
                        ):Center(
                                child: Text("لا توجد نتائج ...",style: TextStyle(color: Colors.white54, fontSize: 20,fontWeight: FontWeight.w700),),
                              ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
