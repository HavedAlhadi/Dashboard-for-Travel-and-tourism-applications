import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';

class MessageCards extends StatefulWidget {
  const MessageCards({Key? key,required this.Contant}) : super(key: key);
  final String Contant;
  @override
  State<MessageCards> createState() => _MessageCardsState();
}

class _MessageCardsState extends State<MessageCards> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return _blueMessage(mq);
  }

  Widget _blueMessage(Size mq) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: mq.width * .01),
        Flexible(
          child: Container(          
              padding: EdgeInsets.all(mq.width * .03),
              margin: EdgeInsets.symmetric(
                  horizontal: mq.width * .03, vertical: mq.height * .01),
              decoration: BoxDecoration(
                  color: purpleLight,
                  border: Border.all(color: orange),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Text(           
                widget.Contant,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    fontSize: 15, color: Colors.white,height: 1.5),
              )),
        ),
      ],
    );
  }
}
