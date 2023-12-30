import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kayan_controle/BoxSelect.dart';
import 'package:kayan_controle/cardServiceInfo.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Customers/Customers.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersCard.dart';
import 'package:kayan_controle/pages/widgets/AnimatedLode.dart';
import 'package:kayan_controle/pages/widgets/PhotoShow.dart';
import '../../../Data/Data.dart';
import '../../../Data/MethodConest.dart';
import '../../../Data/Modle.dart';


Customer NewCust= new Customer(id:"",name: "", numberPhone: "", numPassport: "", ImageTrans: "", StatusTrans: "", TypeTrans: "", NumberTrans: "", DateTrans: "");

class ParnterEdetor extends StatefulWidget {
  ParnterEdetor({Key? key,
  required this.index, 
  required this.id,
  required this.name,
    required this.numberPhone,
    required this.numPassport,
    required this.ImageTrans,
    required this.DateTrans,
    required this.NumberTrans,
    required this.StatusTrans,
    required this.TypeTrans,
  }) : super(key: key);
  final int index;
  final String id;
  final String name;
  final String numberPhone;
  final String numPassport;
  final String ImageTrans;
  final String TypeTrans;
  final String StatusTrans;
  final String NumberTrans;
  final String DateTrans;

  @override
  State<ParnterEdetor> createState() => _ParnterEdetorState();
}

class _ParnterEdetorState extends State<ParnterEdetor> {

  final spinkit = SpinKitWave(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.white : Colors.black,
      ),
    );
  },
);  


void initState(){  
 NewCust.id=widget.id; 
 NewCust.name=widget.name;
 NewCust.numPassport=widget.numPassport;
 NewCust.numberPhone=widget.numberPhone;
 NewCust.ImageTrans=widget.ImageTrans;
 NewCust.StatusTrans=widget.StatusTrans;
 NewCust.NumberTrans=widget.NumberTrans;
 NewCust.DateTrans=widget.DateTrans;
 NewCust.TypeTrans=widget.TypeTrans;
 super.initState();  
}


// إضافة عميل  
AddNewCustente ()async {  
  if(await checkConnection())
  {
  if(widget.index==CustomersListItem.length)
  {      
      if(NewCust.name!="")
      {
            if(NewCust.numberPhone!="")
            {
              if(NewCust.numPassport!=""&&NewCust.numPassport.length<=9&&NewCust.numPassport.length>=9)
              {
                if(NewCust.DateTrans!="")
                {
                  if(NewCust.NumberTrans!="")
                  {                
                     if(NewCust.TypeTrans!="")
                     {
                          if(NewCust.StatusTrans!="")
                        {
                            if(NewCust.ImageTrans!="")
                            {
                               
                              // try
                              // {
                              showDialog(context: context,builder: (BuildContext context){
                                    return AnimtLoded(id: 0,);
                              });
                              CollectionReference CustomerRef=FirebaseFirestore.instance.collection("Customers");
                              await  CustomerRef.add({
                                   "index": CustomersListItem.length,                                                                        
                                      "ImageTrans":NewCust.ImageTrans,                                      
                                      "NameCust":NewCust.name,
                                      "NumberTrans":NewCust.NumberTrans,
                                      "StatusTrans":NewCust.StatusTrans,
                                      "TypeTrans":NewCust.TypeTrans,                                                                            
                                      "numPassport":NewCust.numPassport,
                                      "numberPhone":NewCust.numberPhone,
                                  "DateTrans":NewCust.DateTrans,
                                  "Id":"Ref.id",
                                }).then((DocumentReference Ref) {          
                                    CustomerRef.doc("${Ref.id}").update({
                                    "index": CustomersListItem.length,                                                                        
                                      "ImageTrans":NewCust.ImageTrans,                                      
                                      "NameCust":NewCust.name,
                                      "NumberTrans":NewCust.NumberTrans,
                                      "StatusTrans":NewCust.StatusTrans,
                                      "TypeTrans":NewCust.TypeTrans,                                                                            
                                      "numPassport":NewCust.numPassport,
                                      "numberPhone":NewCust.numberPhone,
                                  "DateTrans":NewCust.DateTrans,
                                  "Id":Ref.id,
                                  });                                
                                Customer Cust1 =new  Customer(
                                id: Ref.id,
                                name: NewCust.name,
                                numberPhone: NewCust.numberPhone,
                                numPassport: NewCust.numPassport,
                                ImageTrans: NewCust.ImageTrans,
                                StatusTrans: NewCust.StatusTrans,
                                TypeTrans: NewCust.TypeTrans,
                                NumberTrans: NewCust.NumberTrans,
                                DateTrans: NewCust.DateTrans);
                                      setState(() {
                                CustomersListItem.add(Cust1);
                                akeyForCustomer.currentState!.insertItem(widget.index);                                
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  ShowMySnakbar(context,"تمت الإضافة بنجاح",blue);
                                  });    
                                });
                              //   }
                              //  catch(ex){
                              //       ShowMySnakbar(context,
                              //     " هناك خطاء حاول مرة أخرى!",
                              //     Color.fromARGB(255, 143, 44, 47));
                              //     AddNewCustente();
                              //  }                                                              
                            }
                            else
                            {
                              ShowMySnakbar(context,
                                  "يجب إدخل صورة المعاملة أو الجواز!",
                                  Color.fromARGB(255, 143, 44, 47)); 
                            }

                        }
                        else
                        {
                          ShowMySnakbar(context,
                              "يجب إدخل حالة المعاملة!",
                              Color.fromARGB(255, 143, 44, 47)); 
                        }
                     }
                     else
                      {
                        ShowMySnakbar(context,
                            "يجب إدخل نوع المعاملة!",
                            Color.fromARGB(255, 143, 44, 47)); 
                      }
                  }
                  else
                  {
                    ShowMySnakbar(context,
                        "يجب إدخل رقم المعاملة!",
                        Color.fromARGB(255, 143, 44, 47)); 
                  }

                }
                else
                {
                  ShowMySnakbar(context,
                      "يجب إدخل تاريخ المعاملة!",
                      Color.fromARGB(255, 143, 44, 47)); 
                }
              }
              else
              {
                ShowMySnakbar(context,
                    " رقم الجواز غير صحيح!",
                    Color.fromARGB(255, 143, 44, 47)); 
              }
            }
            else
            {
              ShowMySnakbar(context,
                  "يجب إدخل هاتف العميل!",
                  Color.fromARGB(255, 143, 44, 47)); 
            }                    
          }
      else
      {
         ShowMySnakbar(context,
            "يجب إدخل إسم العميل!",
            Color.fromARGB(255, 143, 44, 47)); 
      }      
  }
  else
  {
    if(NewCust.name!="")
      {
            if(NewCust.numberPhone!="")
            {
              if(NewCust.numPassport!="")
              {
                if(NewCust.DateTrans!="")
                {
                  if(NewCust.NumberTrans!="")
                  {                
                     if(NewCust.TypeTrans!="")
                     {
                          if(NewCust.StatusTrans!="")
                        {
                            if(NewCust.StatusTrans!="")
                            {                                 
                              // try
                              // {
                              showDialog(context: context,builder: (BuildContext context){
                                    return AnimtLoded(id: 1,);
                              });
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              //   return AnimtLoded();
                              // }));
                              CollectionReference CustomerRef =FirebaseFirestore.instance.collection("Customers");
                              await CustomerRef.doc("${widget.id}").update({                                                                                                         
                                        "index":widget.index,
                                      "ImageTrans":NewCust.ImageTrans,                                      
                                      "NameCust":NewCust.name,
                                      "NumberTrans":NewCust.NumberTrans,
                                      "StatusTrans":NewCust.StatusTrans,
                                      "TypeTrans":NewCust.TypeTrans,                                                                            
                                      "numPassport":NewCust.numPassport,
                                      "numberPhone":NewCust.numberPhone,
                                  "DateTrans":NewCust.DateTrans,
                                  "Id":  widget.id,                                
                              }).then((value) {
                                setState(() {
                                    CustomersListItem[widget.index].name= NewCust.name;
                                    CustomersListItem[widget.index].numberPhone= NewCust.numberPhone;
                                    CustomersListItem[widget.index].numPassport= NewCust.numPassport;                          
                                    CustomersListItem[widget.index].ImageTrans= NewCust.ImageTrans;
                                    CustomersListItem[widget.index].NumberTrans= NewCust.NumberTrans;
                                    CustomersListItem[widget.index].StatusTrans= NewCust.StatusTrans;
                                    CustomersListItem[widget.index].TypeTrans= NewCust.TypeTrans;
                                    CustomersListItem[widget.index].DateTrans= NewCust.DateTrans;                                  
                                    }); 
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  ShowMySnakbar(context,
                                  "تمت التعديل بنجاح",
                                  Color.fromARGB(255, 1, 177, 124));
                              });                                                                                        
                              //  }
                              //  catch(ex){
                              //       ShowMySnakbar(context,
                              //     " هناك خطاء حاول مرة أخرى!",
                              //     Color.fromARGB(255, 143, 44, 47));
                              //     AddNewCustente();
                              //  }                                                                                                     
                            }

                        }
                     }
                  }

                }
              }
            }               
      }
      else
      {
         ShowMySnakbar(context,
            "يجب إدخل إسم  العميل!",
            Color.fromARGB(255, 143, 44, 47)); 
      }
  }
  }
    else
    {
        ShowMySnakbar(context,
      "تاكد من الاتصال بالانترنت",
      Color.fromARGB(255, 4, 65, 59)); 
    }   
}

//حذف شريك
DeleteCustmoer()async
{    
    CollectionReference CustomerRef=FirebaseFirestore.instance.collection("Customers");
    await CustomerRef.doc("${widget.id}").delete();  
  setState(() {
      CustomersListItem.removeAt(widget.index);
      akeyForCustomer.currentState!.removeItem(widget.index, (context, animation) {
        return SizeTransition(
    axis: Axis.vertical,
    sizeFactor: animation,
    child:CustomerContectCard(color: Colors.grey.shade500,indexs: widget.index,press: (){},sero: NewCust));
      });
      }); 
      Navigator.pop(context);      
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBars(context,AddNewCustente),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kPadding),
              decoration: BoxDecoration(
                color: purpleLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: kPadding),
                  child: Stack(
                    children: [
                      ditelsServicesPhoto(
                        typeData: 0,
                        size: size / 1.2,
                        img: widget.ImageTrans,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: kPadding),
              child: Column(
                children: [
                  RowContantInfo(
                      title: "اسم العميل:",
                      subtitle: widget.name,
                      icon: Icons.person,
                      sizeFont: kPadding * 2),
                      RowContantInfo(
                      title: "رقم الهاتف :",
                      subtitle: widget.numberPhone,
                      icon: Icons.phone_in_talk,
                      sizeFont: kPadding * 2),
                      RowContantInfo(
                      title: "رقم الجواز :",
                      subtitle: widget.numPassport,
                      icon: Icons.numbers,
                      sizeFont: kPadding * 2),
                      RowContantInfo(
                      title: "تاريخ المعاملة:",
                      subtitle: widget.DateTrans,
                      icon: Icons.date_range,
                      sizeFont: kPadding * 2), 
                      RowContantInfo(
                      title: "رقم المعاملة:",
                      subtitle: widget.NumberTrans,
                      icon: Icons.power_input,
                      sizeFont: kPadding * 2),
                      RowContantInfo(
                      title: "نوع المعاملة:",
                      subtitle: widget.TypeTrans,
                      icon: Icons.volunteer_activism,
                      sizeFont: kPadding * 2),
                       RowBtnDown(
                      title: "حالة المعاملة:",
                      subtitle: widget.StatusTrans,
                      icon: Icons.abc,
                      sizeFont: kPadding * 2),
                                          
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: widget.index!=CustomersListItem.length? FloatingActionButton(
        backgroundColor: purpleLight,
        onPressed:() async{
        if(await checkConnection())
          {
              ShowAlertdialog(context,DeleteCustmoer,"العميل");
              //Navigator.pop(context);
          }
          else
          {                         
                ShowMySnakbar(context,
                "تاكد من الاتصال بالانترنت",
                Color.fromARGB(255, 4, 65, 59));                               
                Navigator.pop(context);
        }          
        },
        child: Icon(Icons.delete,color: Colors.white,),):null,  
      ),
    );
  }

}
