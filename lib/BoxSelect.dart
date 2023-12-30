import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersEdite.dart';

class RowBtnDown extends StatefulWidget {
  const RowBtnDown({Key? key,
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
  State<RowBtnDown> createState() => _RowBtnDownState();
}

class _RowBtnDownState extends State<RowBtnDown> {
  
  String? valueChoos;
  List items=["جاهزة","قيد المعاملة"];
  void initState()
  {
    if(widget.subtitle!="")
    valueChoos=widget.subtitle;
     super.initState();  
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          InkWell(
            onTap: ()async {
                            
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
              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 16.0,bottom: 16.0,right: 16.0,left: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  //height: 50,
                  decoration: BoxDecoration(                
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:  orange,width: 1,style:BorderStyle.solid)
                  ),
                  child: DropdownButton(              
                    alignment: Alignment.center,
                    hint: Text("اختار عنصر... ",style:TextStyle(fontSize: 20,color:  enabletextdark)),
                    dropdownColor:orange,
                    icon: Icon(Icons.arrow_drop_up),
                    iconSize: 30,
                    isExpanded: true,
                    underline: SizedBox(),
                    items: items.map((e) => DropdownMenuItem(
                      alignment: Alignment.center,                      
                      child: Text("$e",style: TextStyle(color: enabletextdark,fontSize: 18),),value: e,)).toList(),
                     onChanged:(val){
                      setState(() {
                        valueChoos= val.toString();
                        NewCust.StatusTrans=valueChoos!;
                      });
                     },
                     value: valueChoos ),
                ),
              ),              
            ),
          ),          
        ],
      ),
    );
  }
}

