import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/MethodConest.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/cardServiceInfo.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsCards.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsPag.dart';
import 'package:kayan_controle/pages/widgets/AnimatedLode.dart';
import 'package:kayan_controle/pages/widgets/PhotoShow.dart';
import 'package:kayan_controle/widget_tree.dart';
import '../../../Data/Modle.dart';


Accounts_ NewAccont=new Accounts_(id: "",name: "", enable: true, image: "", link: "");
class EdetorAccounts extends StatefulWidget {
  EdetorAccounts({Key? key, 
   required this.nameAcco,
    required this.Enable,
    required this.image,
    required this.index,
    required this.link,
    required this.id
  }) : super(key: key);
  final String id;
    final String nameAcco;
    final int index;
    final bool Enable;
    final String image;
    final String link;

  @override
  State<EdetorAccounts> createState() => _EdetorAccountsState();
}

class _EdetorAccountsState extends State<EdetorAccounts> {

void initState(){  
 NewAccont.id= widget.id;
 NewAccont.name=widget.nameAcco;    
 NewAccont.enable=widget.Enable;
 NewAccont.image=widget.image;
 NewAccont.link=widget.link;
 super.initState();  
}



// إضافة حساب  
AddNewAccount() async{  
if(await checkConnection())
  {
  if(widget.index==Accountslist.length)
  {      
      if(NewAccont.name!="")
      {
        if(NewAccont.link!="")
        {
          if(NewAccont.image!="")
          {

                           showDialog(context: context,builder: (BuildContext context){
                                    return AnimtLoded(id: 3,);
                              });
            CollectionReference AccountsRef=FirebaseFirestore.instance.collection("OurAccounts");
            await AccountsRef.add({
                                      "Image":NewAccont.image,                                      
                                      "Id":"NewAccont.id",
                                      "Name":NewAccont.name,
                                      "Enable":NewAccont.enable,
                                      "Link":NewAccont.link,                                                                            
                                }).then((DocumentReference Ref) {          
                                    AccountsRef.doc("${Ref.id}").update({
                                     "Image":NewAccont.image,                                                                            
                                      "Name":NewAccont.name,
                                      "Enable":NewAccont.enable,
                                      "Link":NewAccont.link,
                                  "Id":Ref.id,
                                  });
                                  Accounts_ Acco1 =new  Accounts_(
                                    id: Ref.id,  
                                    name:  NewAccont.name,
                                    enable:NewAccont.enable,
                                    image: NewAccont.image,
                                    link: NewAccont.link,
                                    );
                                          setState(() {
                                    Accountslist.add(Acco1);
                                    akeyForAccount.currentState!.insertItem(widget.index);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                      });    
                                      ShowMySnakbar(context,"تمت الإضافة بنجاح",blue);
                                 });            
          }
          else{
         ShowMySnakbar(context,
            "يجب إدخل صورة الحساب!",
            Color.fromARGB(255, 143, 44, 47)); 
        } 
        }
        else{
         ShowMySnakbar(context,
            "يجب إدخل رابط الحساب!",
            Color.fromARGB(255, 143, 44, 47)); 
        }                           
      }
      else
      {
         ShowMySnakbar(context,
            "يجب إدخل إسم الحساب!",
            Color.fromARGB(255, 143, 44, 47)); 
      }      
  }
  else
  {
    if(NewAccont.name!="")
      {
        if(NewAccont.link!="")
        {
          if(NewAccont.image!="")
          {
               showDialog(context: context,builder: (BuildContext context){
                                    return AnimtLoded(id: 3,);
                              });
            CollectionReference AccountsRef =FirebaseFirestore.instance.collection("OurAccounts");
                              await AccountsRef.doc("${widget.id}").update({                                                                                                         
                                        "Id":widget.id,
                                      "Image":NewAccont.image,                                      
                                      "Name":NewAccont.name,
                                      "Enable":NewAccont.enable,
                                      "Link":NewAccont.link,
                              }).then((value) {
                                  setState(() {
                                            Accountslist[widget.index].name= NewAccont.name;
                                            Accountslist[widget.index].enable= NewAccont.enable;
                                            Accountslist[widget.index].image= NewAccont.image;
                                            Accountslist[widget.index].link= NewAccont.link;
                                            });                                  
                                   Navigator.pop(context);
                                    Navigator.pop(context);
                                  ShowMySnakbar(context,
                                  "تمت التعديل بنجاح",
                                  Color.fromARGB(255, 1, 177, 124));
                              });                             

          }
          else{
         ShowMySnakbar(context,
            "يجب إدخل صورة الحساب!",
            Color.fromARGB(255, 143, 44, 47)); 
        } 
        }
        else{
         ShowMySnakbar(context,
            "يجب إدخل رابط الحساب!",
            Color.fromARGB(255, 143, 44, 47)); 
        }                           
          }
      else
      {
         ShowMySnakbar(context,
            "يجب إدخل إسم الحساب!",
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

//حذف حساب
DeletAccount()async
{
  CollectionReference AccountsRef=FirebaseFirestore.instance.collection("OurAccounts");
        await AccountsRef.doc("${widget.id}").delete();
  setState(() {
      Accountslist.removeAt(widget.index);
      akeyForAccount.currentState!.removeItem(widget.index, (context, animation) {
        return SizeTransition(
    axis: Axis.vertical,
    sizeFactor: animation,
    child:AccountsContectCard(indexs: widget.index,press: (){},sero: NewAccont,));
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
        appBar: AppBars(context,AddNewAccount),
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
                        typeData: 1,
                        size: size / 1.2,
                        img: widget.image,
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
                      title: "اسم الحساب:",
                      subtitle: widget.nameAcco,
                      icon: Icons.volunteer_activism,
                      sizeFont: kPadding * 2),
                  RowContantInfo(
                      title: "رابط الحساب:",
                      subtitle: widget.link.toString(),
                      icon: Icons.call,
                      sizeFont: kPadding * 2),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: widget.index!=Accountslist.length? FloatingActionButton(
          backgroundColor: purpleLight,
          onPressed:()async{        
            if(await checkConnection())
              {
                    ShowAlertdialog(context,DeletAccount,"الحساب");
              }
              else
              {                         
                    ShowMySnakbar(context,
                    "تاكد من الاتصال بالانترنت",
                    Color.fromARGB(255, 4, 65, 59));                               
                    Navigator.pop(context);
            }
         },
          child: Icon(Icons.delete,color: orange,),):null,
      ),
    );
  }
}
