import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';



class Myinfopro extends StatefulWidget {
  const Myinfopro({ Key? key }) : super(key: key);

  @override
  State<Myinfopro> createState() => _MyinfoproState();
}

class _MyinfoproState extends State<Myinfopro> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       appBar:AppBar(
      title: Text(
        "رجوع",
        textAlign: TextAlign.end,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: purpleLight,
      elevation: 0,      
    ),   
        backgroundColor: purpleLight,      
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [        
          GestureDetector(
            onTap: (){},         
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                    // height: 180,
                    // width: 180,                      
                    decoration: BoxDecoration(
                      color: Colors.transparent,                
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange,width: 1,style:BorderStyle.solid)
                    ),                
                  child: CircleAvatar(                
                  backgroundImage: ExactAssetImage("images/haved.png"),
                  radius: 80,                                                                        // 
                ),
              ),
            ),
          ),
          Positioned(child: Column(children: [
            Card(title: "تطوير :",
                      subtitle: "حفيد للبرمجيات",
                      icon: Icons.person,
                      sizeFont: kPadding * 2,
                      perss: (){}),
                      Card(title: "فيس بوك :",
                      subtitle: "www.facebook.com",
                      icon: Icons.facebook,
                      sizeFont: kPadding * 2,
                      perss: (){}),
                      Card(title: "وتس أب :",
                      subtitle: "+967711055612",
                      icon: Icons.whatsapp,
                      sizeFont: kPadding * 2,
                      perss: (){}),
                       Card(title: "تلجرام :",
                      subtitle: "@Haved7",
                      icon: Icons.telegram,
                      sizeFont: kPadding * 2,
                      perss: (){}),
          ],))
          ,
          ]
      ),      
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
   required this.title,
    required this.subtitle,
    required this.icon,
    required this.sizeFont,
    required this.perss,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  final double sizeFont;
  final Function perss;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListTile(              
          leading: Icon(
            icon,
            color: disabletextledark,
          ),
          title: Text(
            title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: orange,
                fontSize: kPadding * 1.5,
                fontWeight: FontWeight.w300),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(right: kPadding),
            child: Text(
              subtitle,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  height: 2),
            ),
          ),              
        ),
      ),
      onTap: perss(),
    );
  }
}


