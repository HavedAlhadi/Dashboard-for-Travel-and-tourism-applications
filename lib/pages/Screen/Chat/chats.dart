import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Chat/CardsUser.dart';
import 'package:kayan_controle/pages/Screen/Chat/NewMessage.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/pages/Screen/Chat/PageChateMessage.dart';

GlobalKey<AnimatedListState> akeyForMessage=GlobalKey<AnimatedListState>();
class HomeChatsPag extends StatefulWidget {
const HomeChatsPag({Key? key}) : super(key: key);

  @override
  State<HomeChatsPag> createState() => Home_ChatsPagState();
}
var Sco=ScrollController();
class Home_ChatsPagState extends State<HomeChatsPag> {
  
 
  @override
   void initState() {
    super.initState();    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {        
        Sco.animateTo(Sco.position.maxScrollExtent,
        //easeIn
        //easeInCirc
             duration: Duration(milliseconds: 2000), curve: Curves.easeInOutCubic);
        //Sco.jumpTo(Sco.position.maxScrollExtent);
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: akeyForMessage,
        controller: Sco,
        reverse: true,
        shrinkWrap: true,
        initialItemCount: ListUser.length,
          itemBuilder: (context, index,animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset(0, 0),
              ).animate(animation),
              child:UserContectCard(
              indexs: index,
              sero: ListUser[index],
              press: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (Context) => PageChateMessage(
                        index: index,
                        Neme: ListUser[index].name,
                        lastMassag: ListUser[index].lastMassag,
                        number: ListUser[index].number,
                      ))).then((value) {
                       
                      }).then((value) =>     setState((){})  );
              },
            ));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleLight,
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: ((context) => NewMessage())));
          showModalBottomSheet(
              backgroundColor: purpleDark,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),
              context: context,
              builder: (context) {                
                return NewMessage(index: ListUser.length,);
              }).then((value) => setState(() {}));
        },
        child: Icon(Icons.add_comment_rounded,color: Colors.white,),
      ),
    );
  }
}
