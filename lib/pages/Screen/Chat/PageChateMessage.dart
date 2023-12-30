import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Chat/CardsUser.dart';
import 'package:kayan_controle/pages/Screen/Chat/MessagCard.dart';
import 'package:kayan_controle/pages/Screen/Chat/PageChar.dart';
import 'package:kayan_controle/pages/Screen/Chat/Widget_Send.dart';
import 'package:kayan_controle/pages/Screen/Chat/chats.dart';
import 'package:kayan_controle/pages/widgets/AnimatedLode.dart';
import '../../../Data/MethodConest.dart';

GlobalKey<AnimatedListState> akeyForNewMessage=GlobalKey<AnimatedListState>();

MessTabl Nmess=new MessTabl(id: "", numberReceive: "", timeSend: "12:43 AM", Contant: "");
Received Newr=new Received(id: "",name: "", number: "", lastMassag: "");

//ثوابت ادخال الرسالة
TextEditingController txteditNemeRec=TextEditingController();
TextEditingController txteditNumberRec=TextEditingController();
TextEditingController txteditNewMessage=TextEditingController();

//دالة التنظيف بعد الإدخال 
void Clean()
 {
  txteditNemeRec.text="";
  txteditNumberRec.text="";
  txteditNewMessage.text="";
 }

class PageChateMessage extends StatefulWidget {
  const PageChateMessage({Key? key,
  required this.index,
  required this.Neme,
  required  this.number,
  required  this.lastMassag}) : super(key: key);  
  final int index;
  final String Neme;
  final String number;
  final String lastMassag;
  @override
  State<PageChateMessage> createState() => _PageChateMessageState();
}
ScrollController Scoll=ScrollController();
class _PageChateMessageState extends State<PageChateMessage> with SingleTickerProviderStateMixin {  
  BuildContext? context3;
bool ChickRec(String number)
  {
    for(int i=0;i<ListUser.length;i++)
    {
      if(number==ListUser[i].number)
      {
        return true;
      }

    }
    return false;
  }
//حذف الدردشة مع عميل
void DeletMessage() async
{
   if(await checkConnection())
    {
      Navigator.pop(context); 
      CollectionReference ReceivesRef=FirebaseFirestore.instance.collection("Receives");
      CollectionReference MessTablRef=FirebaseFirestore.instance.collection("MessTabl");
      for (int i=0;i<TableMessages.length;i++)
          {
            if(TableMessages[i].numberReceive==widget.number)
              {
                            MessTablRef.doc("${TableMessages[i].id}").delete();                          
              }
          }    
      await ReceivesRef.doc("${ListUser[widget.index].id}").delete().then((value) {          
      });            
      delUI();     
    }
    else
    {                         
          ShowMySnakbar(context,
          "تاكد من الاتصال بالانترنت",
          Color.fromARGB(255, 4, 65, 59));                               
          Navigator.pop(context);
    }                   
}
delUI()async
{
      ListUser.removeAt(widget.index);
       akeyForMessage.currentState!.removeItem(widget.index, (context, animation) {
                    return SizeTransition(
                    axis: Axis.vertical,
                    sizeFactor: animation,
                    child:UserContectCard(indexs: widget.index,press: (){},sero: Newr));
                      });
        TableMessages.clear();
         await FirebaseFirestore.instance.collection("MessTabl").get().then((element) {
      element.docs.forEach((element) {
        MessTabl Messages=new MessTabl(id: element.get("Id"), Contant: element.get("Contant"),
         numberReceive:element.get("numberReceive"),  timeSend: element.get("timeSend"),);        
        TableMessages.add(Messages);                     
      });      
    });
}

UpdetUi()
{
   var NewRa=ListUser.removeAt(widget.index);                                                                                                   
  akeyForMessage.currentState!.removeItem(widget.index, (context, animation) {
                          return SizeTransition(
                          axis: Axis.vertical,
                          sizeFactor: animation,
                          child:UserContectCard(indexs: widget.index,press: (){},sero: Newr));
                            });                            
                        ListUser.add(NewRa);
                        akeyForMessage.currentState!.insertItem(widget.index,duration: const Duration(milliseconds: 10));     
                          Sco.jumpTo(Sco.position.maxScrollExtent);                                                                     
}

@override
  void initState() {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {        
        try
        {
          Scoll.jumpTo(Scoll.position.maxScrollExtent);
        // Scoll.animateTo(Scoll.position.maxScrollExtent,
        //      duration: Duration(milliseconds: 100), curve: Curves.ease);
        }
            catch(es){}
      });
    });
    });
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    context3=context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleLight,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:() {          
          Navigator.pop(context);},),
        flexibleSpace: MyAppBar(DeletMessage),
      ),
      body:BottomSendNavigation() 
//       SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(children: [
//             Expanded(
              
//               child: AnimatedList(
//                 controller: Scoll,
//                 key: akeyForNewMessage,
//                 shrinkWrap: true,
//                 initialItemCount: TableMessages.length,
//                 itemBuilder: ((context, index, animation) 
//                 { return (widget.number!=TableMessages[index].numberReceive)? Spacer()             
//                 :MessageCards(
//                   Contant: TableMessages[index].Contant);})),
//             ),    
//             SizedBox(height: 3),                                
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ChatInput(index: widget.index,TypePageOpen: 0)),            
//           ]),       
//           ),
//       )
    );
  }

//this Appbar ChatCustomer
  Widget MyAppBar(Function delelet) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 30),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: orange,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.Neme,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            widget.number,
            style: TextStyle(color: Colors.white),
            maxLines: 1,
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async{
               if(await checkConnection())
                  {
                      ShowAlertdialog(context,delelet,"الدردشة");
                  }
                  else
                  {                         
                        ShowMySnakbar(context,
                        "تاكد من الاتصال بالانترنت",
                        Color.fromARGB(255, 4, 65, 59));                               
                        //Navigator.pop(context);
                }       
            },
            color: orange,
          )),
    );
  }
}

