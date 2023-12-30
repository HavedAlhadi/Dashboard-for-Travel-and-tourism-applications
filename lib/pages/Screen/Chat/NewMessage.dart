import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Chat/PageChateMessage.dart';
import 'package:kayan_controle/pages/Screen/Chat/Widget_Send.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
   void ChickRecName(String number)
  {
    for(int i=0;i<ListUser.length;i++)
    {
      if(number==ListUser[i].number)
      {
        setState(() {
        txteditNemeRec.text=ListUser[i].name;  
        });
      }
      else
      {
        setState(() {
        txteditNemeRec.text="";  
        });
        
      }

    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Card(
                  color: purpleDark,
                  child: Text(
                    "رسالة جديدة",
                    style: TextStyle(
                        color: enabletextdark, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Card(
                    color: purpleDark,
                    margin: EdgeInsets.symmetric(vertical: kPadding,horizontal: kPadding),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextField(        
                        controller: txteditNemeRec,                
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        style: TextStyle(
                            color: enabletextdark, fontSize: 17),
                        decoration: InputDecoration(
                          hintText: "",
                          hintStyle: TextStyle(
                              color: enabletextdark, fontSize: 20),
                          hintTextDirection: TextDirection.rtl,
                          border: InputBorder.none,
                          fillColor: enabletextdark,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text(" :إسم العميل",style:TextStyle(
                                  color: orange, fontSize: 16,fontWeight: FontWeight.w700)),
                          ), 
                          prefixIcon: Icon(
                            Icons.person_add_alt_1,
                            color: enabletextdark,
                          ),
                        ),
                        textDirection: TextDirection.rtl,                        
                      ),
                    ),
                  ),
                ),
                
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Card(
                    color: purpleDark,
                    margin: EdgeInsets.symmetric(vertical: kPadding,horizontal: kPadding),
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextField(   
                        autofocus: true,
                        onChanged: ((value) => ChickRecName(value)),
                        controller: txteditNumberRec,                     
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        style: TextStyle(
                            color: enabletextdark, fontSize: 17),
                        decoration: InputDecoration(
                          hintText: "",
                          hintStyle: TextStyle(
                              color: enabletextdark, fontSize: 20),
                          hintTextDirection: TextDirection.rtl,
                          border: InputBorder.none,
                          fillColor: enabletextdark,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: Text(" :رقم العميل",style:TextStyle(
                                  color: orange, fontSize: 16,fontWeight: FontWeight.w700)),
                          ), 
                          prefixIcon: Icon(
                            Icons.phone,
                            color: enabletextdark,
                          ),
                        ),
                        textDirection: TextDirection.rtl,                        
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),                                
              ChatInput(index: widget.index,TypePageOpen: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
