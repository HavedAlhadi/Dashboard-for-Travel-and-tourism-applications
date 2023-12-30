import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsEditor.dart';
import 'package:kayan_controle/pages/Screen/Customers/Customers.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersEdite.dart';

class RowContantInfo extends StatefulWidget {
   RowContantInfo({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.sizeFont,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  final double sizeFont;

  @override
  State<RowContantInfo> createState() => _RowContantInfoState();
}

class _RowContantInfoState extends State<RowContantInfo> {
 
 TextEditingController txteditTitle=TextEditingController();

void initState(){
 txteditTitle.text = widget.subtitle;
  if(widget.title== "اسم العميل:")
  {
   NewCust.name=widget.subtitle; 
  }
  else if(widget.title== "رقم الهاتف :")
  {
   NewCust.numberPhone=widget.subtitle; 
  }
  else if(widget.title== "رقم الجواز :")
  {
   NewCust.numPassport=widget.subtitle; 
  }
  else if(widget.title== "رقم المعاملة:")
  {
   NewCust.NumberTrans=widget.subtitle; 
  }
  else if(widget.title==   "نوع المعاملة:")
  {
   NewCust.TypeTrans=widget.subtitle; 
  }
  else if(widget.title==   "تاريخ المعاملة:")
  {
   NewCust.DateTrans=widget.subtitle; 
  } 
  else if(widget.title==   "حالة المعاملة:")
  {
   NewCust.StatusTrans=widget.subtitle; 
  }
  else if(widget.title== "اسم الحساب:")
  {
  NewAccont.name=widget.subtitle;    
  } 
  else if(widget.title==  "رابط الحساب:")
  {
  NewAccont.link=widget.subtitle;    
  } 
 super.initState();
}

void PressBtnSave(String TextContant)
{
  if(TextContant!="")
  {
      if(widget.title== "اسم العميل:")
      {
      NewCust.name=txteditTitle.text.toString();    
      }
      else if(widget.title== "رقم الهاتف :")
      {
      NewCust.numberPhone=txteditTitle.text.toString(); 
      }
      else if(widget.title== "رقم الجواز :")
      {
      NewCust.numPassport=txteditTitle.text.toString();
      }
      else if(widget.title== "رقم المعاملة:")
      {
      NewCust.NumberTrans=txteditTitle.text.toString();
      }
      else if(widget.title==   "نوع المعاملة:")
      {
      NewCust.TypeTrans=txteditTitle.text.toString();
      }       
      else if(widget.title== "اسم الحساب:")
      {
      NewAccont.name=txteditTitle.text.toString();    
      }
      else if(widget.title== "رابط الحساب:")
      {
      NewAccont.link=txteditTitle.text.toString();    
      }       
  } 
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          InkWell(
            onTap: ()async {
              if(widget.title==   "تاريخ المعاملة:")
              {
                DateTime? resdate=await showDatePicker(context: context,
                textDirection: TextDirection.rtl,
                 initialDate: new DateTime.now(),
                  firstDate: DateTime(2022),
                   lastDate: DateTime(2050));
                   if(resdate==null)
                   {
                    setState(() {txteditTitle.text=NewCust.DateTrans;}); 
                   }
                   else{                                 
                        setState(() {
                          NewCust.DateTrans=getDateNow(resdate);
                          txteditTitle.text=getDateNow(resdate);
                        });
                   }                  
              }
              else
              {
                FormEnterInfo(context, widget.title, widget.subtitle);
              }              
            },
            child: ListTile(              
              leading: Icon(
                widget.icon,
                color: enabletextdark,
              ),
              title: Text(
                widget.title,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: orange,
                    fontSize: kPadding * 1.5,
                    fontWeight: FontWeight.w300),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(right: kPadding),
                child: Text(
                  txteditTitle.text,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 18,
                      color: enabletextdark,
                      fontWeight: FontWeight.w500,
                      height: 2),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: InkWell(
                  child: Icon(
                    Icons.edit,
                    color: orange,
                  ),
                  onTap: () {
                    //   FormEnterInfo(context, title, subtitle);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kPadding * 5.5),
            child: Divider(
              color: purpleLight,
              thickness: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> FormEnterInfo(
      BuildContext context, String title, String subtitle) {
    return showModalBottomSheet(
        backgroundColor: purpleLight,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        )),
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  //height: 180,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        "إدخل " + title,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: orange, fontSize: 20),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: kPadding * 3,
                            left: kPadding * 3),
                        child: TextFormField(
                          controller: txteditTitle,                          
                           keyboardType: (
                          widget.title== "رقم الهاتف :"||
                           widget.title== "رقم الجواز :"||
                           widget.title== "رقم المعاملة:")?TextInputType.number:TextInputType.text,
                         maxLength:widget.title== "رقم الجواز :"? 9:300,
                          autofocus: true,
                          textDirection: TextDirection.rtl,
                          maxLines: 5,
                          minLines: 1,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: orange)),
                            hintStyle: TextStyle(
                                color: enabletextdark, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: kPadding * 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: kPadding * 2,
                                    left: kPadding * 2,
                                    right: kPadding,
                                    bottom: kPadding ,
                                    ),
                                width: 70,
                                child: Text(
                                  "إلغاء",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                              onTap: () {
                                 if(title== "اسم العميل:")
                                {
                                  setState(() {
                                    txteditTitle.text=NewCust.name;
                                  }); 
                                }
                                else if(title== "رقم الهاتف :")
                                {
                                   setState(() {
                                    txteditTitle.text=NewCust.numberPhone;
                                  }); 
                                }
                                else if(title== "رقم الجواز :")
                                {
                                setState(() {
                                    txteditTitle.text=NewCust.numPassport;
                                  });  
                                }
                                else if(title== "رقم المعاملة:")
                                {
                                setState(() {
                                    txteditTitle.text=NewCust.NumberTrans;
                                  }); 
                                }
                                else if(title==   "نوع المعاملة:")
                                {
                                setState(() {
                                    txteditTitle.text=NewCust.TypeTrans;
                                  });  
                                }                               
                                else if(title==   "حالة المعاملة:")
                                {
                                setState(() {
                                    txteditTitle.text=NewCust.StatusTrans;
                                  }); 
                                }
                                 else if(title==  "اسم الحساب:")
                                {
                                  setState(() {
                                    txteditTitle.text=NewAccont.name;
                                  }); 
                                }        
                                 else if(title==  "رابط الحساب:")
                                {
                                  setState(() {
                                    txteditTitle.text=NewAccont.link;
                                  }); 
                                }                               
                                Navigator.pop(context);                                
                              },
                            ),
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: kPadding * 2,
                                    left: kPadding * 2,
                                    right: kPadding ,
                                    bottom: kPadding ,
                                    ),
                                width: kPadding * 7,
                                child: Text(
                                  "حفظ",
                                  style: TextStyle(
                                      color:Colors.white,
                                      fontSize: 20),
                                ),
                              ),
                              onTap: () {    
                                PressBtnSave(txteditTitle.text.toString());  
                                 Navigator.pop(context);                                 
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
