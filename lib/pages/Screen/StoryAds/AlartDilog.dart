import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kayan_controle/Data/Data.dart';
import 'package:kayan_controle/Data/MethodConest.dart';
import 'package:kayan_controle/Data/Modle.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/HomePag.dart';
import 'package:kayan_controle/pages/Screen/StoryAds/Stories.dart';

class EditeAds extends StatefulWidget {
  const EditeAds({ Key? key,required this.image,required this.name,required this.index,required this.idFir }) : super(key: key);
  final String image;
  final String name;
  final int index;
  final String idFir;
  @override
  State<EditeAds> createState() => Edite_AdsState();
}

class Edite_AdsState extends State<EditeAds> {
 final txtedit=TextEditingController();
  String TextBut="إضافة";
 MainAxisAlignment MymainAxisAlignment= MainAxisAlignment.center;

void initState(){  
 txtedit.text=widget.name;
 if(widget.index==0)
 {
  setState(() {
    TextBut="إضافة";
    MymainAxisAlignment= MainAxisAlignment.center;
  });
 }
 else
 {
  TextBut="تعديل";
  MymainAxisAlignment= MainAxisAlignment.spaceEvenly;
 }
 super.initState();  
}

//إضافة إعلان جديد في التطبيق
AddNewAds()async {
      
      String did;
        Story s;
        CollectionReference StoryAdsRef=FirebaseFirestore.instance.collection("StoryAds");
          StoryAdsRef.add({
            "index": Mstories.length,
            "title":txtedit.text,
            "image":widget.image,
            "id":"fdgfd"
          }).then((DocumentReference Ref) {          
              StoryAdsRef.doc("${Ref.id}").update({
              "index": Mstories.length,
            "title":txtedit.text,
            "image":widget.image,
            "id":Ref.id,
            });
          s=new Story(Id:Ref.id,index:widget.index,img: widget.image, name: txtedit.text.toString());
          Mstories.add(s);
          akey.currentState!.insertItem(Mstories.length-1);        
          });
          ShowMySnakbar(context,"تمت الإضافة بنجاح",blue);
} 
  
//دالة حذف الأعلان عن الخدمة  
  DeletAds ()async
  {
     CollectionReference StoryAdsRef=FirebaseFirestore.instance.collection("StoryAds");
        await StoryAdsRef.doc("${widget.idFir}").delete().then((value) {
           Mstories.removeAt(widget.index);
           akey.currentState!.removeItem(widget.index, (context, animation) {
           return SizeTransition(
           axis: Axis.horizontal,
           sizeFactor: animation,
           child: MyStory(img: widget.image, name: widget.name, function: null, index: 0)); 
           });    
           Navigator.pop(context);
           ShowMySnakbar(context,
           "تم الحذف!",
           Color.fromARGB(255, 4, 189, 136));
        });
       
  }  

//دالة إضافة الاعلان
AddAds() async
{
  if(widget.image!="")
    {
      if(txtedit.text!="") 
        {
          if(await checkConnection())
          {
          AddNewAds();
          }
          else
          {
            ShowMySnakbar(context,
            "تاكد من الاتصال بالانترنت",
            Color.fromARGB(255, 4, 65, 59)); 
          }
          //Navigator.pop(context);
                 
        }
        else 
        {
          ShowMySnakbar(context,
          "يجب إدخل وصف الخدمة!",
          Color.fromARGB(255, 143, 44, 47)); 
        }
        }
}
//دالة التعديل
DoneUpdate() async
  {
    if(txtedit.text!="") 
      { 
        CollectionReference StoryAdsRef=FirebaseFirestore.instance.collection("StoryAds");
        await StoryAdsRef.doc("${widget.idFir}").update({
          "index": widget.index,
        "title":txtedit.text.toString(),
        "image":widget.image,
        }).then((value) {
           setState(() {
        Mstories[widget.index].name=txtedit.text.toString(); 
        Mstories[widget.index].img!=widget.image; 
        }); 
        Navigator.pop(context);    
          ShowMySnakbar(context,
            "تمت التعديل بنجاح",
            Color.fromARGB(255, 1, 177, 124));         
        });
      }
      else 
      {
        Navigator.pop(context);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        //overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: purpleLight,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white,width: 1),
            ),
            height: 200,
            child: Column(
              children: [                        
               Padding(
                 padding: const EdgeInsets.only(top: 80),
                 child: TextField(              
             controller: txtedit,
              autofocus: true,
              textAlign: TextAlign.center,
                   decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.5),       
              border: InputBorder.none,
              hintText: ' ...عنوان الخدمة ',
              hintStyle: TextStyle(color: Colors.white54, fontSize: 20,fontWeight: FontWeight.w700),
            ),
            style: TextStyle(color: Colors.white,fontSize: 20),
            textDirection: TextDirection.rtl,
            ),
               ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MymainAxisAlignment,
              children: [
                  widget.index!=0? Card(                     
                  color: Colors.redAccent,
                  elevation: 4,
                  shadowColor: orange,                   
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                  side: BorderSide(color: disabletextledark),
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                    child: GestureDetector(
                      child: Text(" حذف  ",style: TextStyle(color: enabletextdark,fontSize: 20)),
                      onTap: ()async {
                        if(await checkConnection())
                        {
                            DeletAds();
                        }
                        else
                        {                         
                              Navigator.pop(context);
                              ShowMySnakbar(context,
                              "تاكد من الاتصال بالانترنت",
                              Color.fromARGB(255, 4, 65, 59));                               
                              
                      }
                      },
                      
                    ),
                  ),
                ):SizedBox(width: 0,),
                Card(
                  color: Colors.blueAccent,                     
                  elevation: 4,
                  shadowColor: orange,                   
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                  side: BorderSide(color: disabletextledark),  
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                    child: GestureDetector(
                      child: Text(TextBut,style: TextStyle(color: enabletextdark,fontSize: 20)),
                      onTap: () async{
                        if(widget.index==0)
                          AddAds();
                        else
                        {
                          if(await checkConnection())
                              {
                                DoneUpdate();
                              }
                              else
                              {                         
                                    Navigator.pop(context);
                                    ShowMySnakbar(context,"تاكد من الاتصال بالانترنت",Color.fromARGB(255, 4, 65, 59));                                                                   
                              }                       
                        }                        
                      },
                    ),
                  ),
                ),                   
              ],),              
              ],
            ),
          ),
            Positioned(
              top: -70,                
                child: Container(
                  decoration: BoxDecoration(                
                    shape: BoxShape.circle,
                    //image: DecorationImage(image: widget.image.image,fit: BoxFit.cover),
                    color: purpleLight,
                    border: Border.all(color: Colors.white38,width: 1,style:BorderStyle.solid)
                  ),
                child: CircleAvatar(
                backgroundImage:widget.image!=""? Image.memory(base64Decode(widget.image),fit: BoxFit.cover,).image:ExactAssetImage("images/AddStory.png"),
                backgroundColor: purpleLight,
                radius: 70,      
                ),
              ),),              
              Positioned(
              left: -10,
              top: -40,                
                child: IconButton(icon: Icon(Icons.close,color: orange,size: 30,),onPressed: (){Navigator.pop(context);},)),
        
        ]),
    );
  }
}