import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import '../../../Data/Modle.dart';

class AccountsContectCard extends StatefulWidget {
  const AccountsContectCard({
    Key? key,
    required this.indexs,
    required this.sero,
    required this.press,
  }) : super(key: key);
  final int indexs;
  final Accounts_ sero;
  final Function press;

  @override
  State<AccountsContectCard> createState() => _AccountsContectCardState();
}

class _AccountsContectCardState extends State<AccountsContectCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kPadding, vertical: kPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(100),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(5)),
        gradient: LinearGradient(
                      colors: [
                        red.withOpacity(0.9),
                        orange.withOpacity(0.9),
                      ],
                    ),
        // boxShadow: BoxShadow()
      ),
      height: 70,
      child: InkWell(
        onTap: () {
          widget.press();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 69.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  //topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(100),
                  topRight: Radius.circular(100)
                ),
                color: purpleDark,
              ),
            ),
            Positioned(
              right: 80,
              child: SizedBox(
                height: 78,
                width: size.width - 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          widget.sero.name,
                          style: TextStyle(
                              color: enabletextdark,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Switch(
                              value: widget.sero.enable,
                              onChanged: (val) {
                                setState(() {
                                  widget.sero.enable = val;
                                });
                              }),
                          //Spacer(),
                          SizedBox(width: 15,),
                          Icon(
                            Icons.edit,
                            color: orange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                backgroundImage: Image.memory(base64Decode(widget.sero.image),fit: BoxFit.cover,).image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
