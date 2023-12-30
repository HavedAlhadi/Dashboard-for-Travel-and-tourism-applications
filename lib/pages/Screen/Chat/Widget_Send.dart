import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/MethodConest.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Chat/CardsUser.dart';
import 'package:kayan_controle/pages/Screen/Chat/PageChateMessage.dart';
import 'package:kayan_controle/pages/Screen/Chat/chats.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
class ChatInput extends StatefulWidget {
  const ChatInput({ Key? key,required this.index,required this.TypePageOpen,  
  }) : super(key: key);  
  final int index;
  final int TypePageOpen;
  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {  
  String NameR="";
 String IdR="";
 String NumR="";
 int indexCust=0;
 TwilioFlutter? myTwilioFlutter;
  bool ChickRec(String number)
  {
    for(int i=0;i<ListUser.length;i++)
    {
      if(number==ListUser[i].number)
      {
        NameR=ListUser[i].name;
        NumR=ListUser[i].number;
        IdR=ListUser[i].id;
        indexCust=i;
        return true;
      }

    }
    return false;
  }
UpdetUi(int Index)
{
  setState(() {
    var NewRa=ListUser.removeAt(Index); 
    NewRa.lastMassag=TableMessages[TableMessages.length-1].id;
    print(NewRa.lastMassag);                                                                                                  
    akeyForMessage.currentState!.removeItem(Index, (context, animation) {
                          return SizeTransition(
                          axis: Axis.vertical,
                          sizeFactor: animation,
                          child:UserContectCard(indexs: Index,press: (){},sero: Newr));
                            });                            
                        ListUser.add(NewRa);
                        akeyForMessage.currentState!.insertItem(ListUser.length-1,duration: const Duration(milliseconds: 10));     
                          Sco.jumpTo(Sco.position.maxScrollExtent);
                          //ListUser[ListUser.length-1].lastMassag=
  });
                                                                                                                           
}
UpdetEndMessage()
{
  setState(() {
            ListUser[widget.index].lastMassag;  
            });
}
SendSms()async
{
  myTwilioFlutter!.sendSMS(toNumber: "‘*************’", messageBody: "‘Flutter Twilio SMS Test’"); 
}
//إرسال رسالة
  addNewMessage() async
  {
    if(txteditNewMessage.text!="")
    {
    if(ChickRec(txteditNumberRec.text)!=true&&widget.TypePageOpen==1)
    {
      if(txteditNemeRec.text!="")
      {
        if(txteditNumberRec.text!="")
        {
          CollectionReference ReceivesRef=FirebaseFirestore.instance.collection("Receives");
          CollectionReference MessTablRef=FirebaseFirestore.instance.collection("MessTabl");
          MessTabl Nmess;
          MessTablRef.add({
            "Id": "g",
            "numberReceive":txteditNumberRec.text,
            "timeSend":DateNow(),
            "Contant":txteditNewMessage.text,
          }).then((DocumentReference Ref) {          
               MessTablRef.doc("${Ref.id}").update({
               "Id": Ref.id,
            "numberReceive":txteditNumberRec.text,
            "timeSend":DateNow(),
            "Contant":txteditNewMessage.text,
            });
            Nmess=new MessTabl(id: Ref.id, numberReceive: txteditNumberRec.text, timeSend: DateNow(), Contant: txteditNewMessage.text);
              ReceivesRef.add({
             "Id": "g",
            "number":txteditNumberRec.text,
            "name":txteditNemeRec.text,
            "lastMassag":Ref.id,
            }).then((DocumentReference Ref2) {
              ReceivesRef.doc("${Ref2.id}").update({
             "Id": Ref2.id,
            "number":txteditNumberRec.text,
            "name":txteditNemeRec.text,
            "lastMassag":Ref.id, 
          });
          Received NewR=new Received(id: Ref2.id,name: txteditNemeRec.text, number: txteditNumberRec.text, lastMassag: Ref.id);      
            setState(() {              
            TableMessages.add(Nmess);
            ListUser.add(NewR);
            akeyForMessage.currentState!.insertItem(widget.index,duration: const Duration(milliseconds: 100));
            
              if(widget.TypePageOpen!=0)
              {
                Navigator.pop(context);
              }
              Clean();              
            });
            });
            }).then((value){
               setState(() {
                  Sco.animateTo(Sco.position.maxScrollExtent,
             duration: Duration(milliseconds: 100), curve: Curves.easeIn);
               });
            });           
       }
         else
            {
              Navigator.pop(context);
                ShowMySnakbar(context,
                  "يجب إدخل رقم المستلم!",
                  Color.fromARGB(255, 143, 44, 47));
            }
        
      }
      else
      {
        Navigator.pop(context);
         ShowMySnakbar(context,
            "يجب إدخل إسم المستلم!",
            Color.fromARGB(255, 143, 44, 47));
      }
}
else
{
  if(widget.TypePageOpen!=1)
  {
    CollectionReference MessTablRef=FirebaseFirestore.instance.collection("MessTabl");
          MessTabl Nmess;
          MessTablRef.add({
            "Id": "g",
            "numberReceive":ListUser[widget.index].number,
            "timeSend":DateNow(),
            "Contant":txteditNewMessage.text,
          }).then((DocumentReference Ref) {          
               MessTablRef.doc("${Ref.id}").update({
               "Id": Ref.id,
            "numberReceive":ListUser[widget.index].number,
            "timeSend":DateNow(),
            "Contant":txteditNewMessage.text,
            });
            Nmess=new MessTabl(id: Ref.id, numberReceive: ListUser[widget.index].number, timeSend: DateNow(), Contant: txteditNewMessage.text);              
            setState(() {              
            TableMessages.add(Nmess);
            akeyForNewMessage.currentState!.insertItem(TableMessages.length-1);
            Scoll.animateTo(Scoll.position.maxScrollExtent,
             duration: Duration(milliseconds: 10), curve: Curves.easeOut);
            Sco.animateTo(Sco.position.maxScrollExtent,
             duration: Duration(milliseconds: 2000), curve: Curves.easeInOutCubic);                          
            if(widget.TypePageOpen!=0)
              {
                Navigator.pop(context);
              }
              Clean();
            });
            }).then((value) {UpdetUi(widget.index);                        
            });
                                    
  }
   else
   { 
            if(txteditNumberRec.text!="")
            {
              CollectionReference ReceivesRef=FirebaseFirestore.instance.collection("Receives");
              CollectionReference MessTablRef=FirebaseFirestore.instance.collection("MessTabl");              
                 MessTablRef.add({
                    "Id": "g",
                    "numberReceive":txteditNumberRec.text,
                    "timeSend":DateNow(),
                    "Contant":txteditNewMessage.text,
                  }).then((DocumentReference Ref) async{          
                   await MessTablRef.doc("${Ref.id}").update({
                    "Id": Ref.id,
                    "numberReceive":txteditNumberRec.text,
                    "timeSend":DateNow(),
                    "Contant":txteditNewMessage.text,
                    }).then((value) async{
                       await ReceivesRef.doc("${IdR}").update({
                      "Id": IdR,
                      "number":NumR,
                      "name":NameR,
                      "lastMassag":Ref.id, 
                    });   
                    });
                    MessTabl Nmess=new MessTabl(id: Ref.id, numberReceive: NumR, timeSend: DateNow(), Contant: txteditNewMessage.text);                                                                      
                     TableMessages.add(Nmess);                                        
                    }).then((value) => Clean());
                    setState(() {
                    ListUser[indexCust].lastMassag=TableMessages[TableMessages.length-1].id;                    
                    }); 
                    if(widget.TypePageOpen!=0)
                      {
                        Navigator.pop(context);
                      }                      
                       ShowMySnakbar(context,"تم الإرسال",blue);                                    
            }
            else
                {
                  Navigator.pop(context);
                    ShowMySnakbar(context,
                      "يجب إدخل رقم المستلم!",
                      Color.fromARGB(255, 143, 44, 47));
                }                     
    }
}
    }    
}
  
  @override
    void initState() {
    var myTwilioFlutter = TwilioFlutter(
        accountSid: "‘***************************************’",
        authToken: "‘*************************************’",
        twilioNumber: "‘******************’",
    );
    super.initState();
    }
  Widget build(BuildContext context) {
    return Card(      
    color: purpleDark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 15,
    child: Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kPadding * 0.09),
      child: Row(
        children: [
          MaterialButton(
            onPressed: ()  async {  
               if(await checkConnection())
                  {
                      addNewMessage();
                  }
                  else
                  {                         
                        ShowMySnakbar(context,
                        "تاكد من الاتصال بالانترنت",
                        Color.fromARGB(255, 4, 65, 59));                               
                        //Navigator.pop(context);
                }            
                                                                                        
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.send,
                textDirection: TextDirection.rtl,
                color: enabletextdark,
                size: 30,
              ),
            ),
            shape: CircleBorder(),
            color: orange,
            padding: EdgeInsets.only(right: 1),
            height: 40,
            minWidth: 40,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextField(
              controller: txteditNewMessage,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: enabletextdark, fontSize: 18),
              decoration: InputDecoration(
                hintText: "هنا أدخل نص الرسالة...",
                hintStyle:
                    TextStyle(color: enabletextdark, fontSize: 20),
                hintTextDirection: TextDirection.rtl,
                border: InputBorder.none,
                fillColor: enabletextdark,
              ),
              textDirection: TextDirection.rtl,
            ),
          )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions,
                color: enabletextdark,
                size: 30,
              )),
        ],
      ),
    ),
  ); 
  }
}
