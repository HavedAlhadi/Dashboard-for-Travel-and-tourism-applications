import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Chat/PageChateMessage.dart';
// import 'package:path/path.dart';

class UserContectCard extends StatefulWidget {
  const UserContectCard({
    Key? key,
    required this.indexs,
    required this.sero,
    required this.press,
  }) : super(key: key);
  final int indexs;
  final Received sero;
  final Function press;

  @override
  State<UserContectCard> createState() => UserContectCardState_();
}
class UserContectCardState_ extends State<UserContectCard> {
  String Cont="";
  String times="";
  initState()
  {
    for(int i=0;i<TableMessages.length;i++)
    {
      if(widget.sero.lastMassag==TableMessages[i].id)
      {
        Cont=TableMessages[i].Contant;
        times=TableMessages[i].timeSend;
      }
    }
    super.initState();
  }
  
  
  @override  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: kPadding * 0.4, vertical: 4),
      color: purpleDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: InkWell(
        onTap: () {
        widget.press();
        print(widget.indexs.toString());
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(
            widget.sero.name,
            style: TextStyle(color: enabletextdark),
          ),
          subtitle: Text(
            Cont,
            style: TextStyle(color: enabletextdark),
            maxLines: 1,
          ),
          trailing: Text(
            times,
            style: TextStyle(color: enabletextdark),
          ),
        ),
      ),
    );
    ;
  }
}
