import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import '../../../Data/Modle.dart';

class CustomerContectCard extends StatefulWidget {
  const CustomerContectCard({
    Key? key,
    required this.indexs,
     required this.color,
    required this.sero,
    required this.press,
  }) : super(key: key);
  final int indexs;
  final Customer sero;
  final Function press;
  final Color color;

  @override
  State<CustomerContectCard> createState() => _CustomerContectCardState();
}

class _CustomerContectCardState extends State<CustomerContectCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: widget.color!=Colors.black45? purpleDark.withOpacity(1):purpleLight,
      elevation: 0.5,      
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: kPadding/2, vertical: kPadding / 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
         gradient: LinearGradient(
                      colors: [
                        red.withOpacity(0.9),
                        orange.withOpacity(0.9),
                      ],
                    ),
          // boxShadow: BoxShadow()
        ),
        height: 80,
        child: InkWell(
          onTap: () {
            widget.press();
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 79.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(100)),
                  color: widget.color,
                  // boxShadow: BoxShadow()
                ),
              ),
              Positioned(
                right: 70,
                child: SizedBox(
                  height: 79,
                  width: size.width - 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15,right: 20,bottom: 15),
                              child: Text(
                                "العميل:  "+widget.sero.name,
                                style: TextStyle(
                                    color: widget.color==Colors.black45? Colors.white:enabletextdark,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "نوع المعاملة:  "+widget.sero.TypeTrans,
                                style: TextStyle(
                                    color: widget.color==Colors.black45? Colors.white:enabletextdark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:Icon(
                              widget.sero.StatusTrans=="جاهزة"? Icons.circle:Icons.circle_outlined,
                              color: orange,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: kPadding,
                top: 0,
                child: Container(
                  //color: Colors.amberAccent,
                  padding: EdgeInsets.only(right: 2),
                  height: kPadding * 6.5,
                  width: kPadding * 6.5,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white54,
                    backgroundImage: Image.memory(base64Decode(widget.sero.ImageTrans),fit: BoxFit.cover,).image,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
