import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';


class  MyStory extends StatefulWidget {
  const MyStory({Key? key,
  required this.img,
  required this.name,
  required this.function,
  required this.index }) 
  : super(key: key);
  final String img;
  final String name;
  final int index;
  final function ;
  @override
  State<MyStory>createState() => My_SStory();
}

class My_SStory extends State<MyStory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [        
        GestureDetector(
          onTap: widget.function,         
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              decoration: BoxDecoration(                
                    shape: BoxShape.circle,
                    color: purpleLight,
                    border: Border.all(color: Colors.white38,width: 1,style:BorderStyle.solid)
                  ),                                                  
                child: Container(
                  height: 74,
                  width: 74,
                  decoration: BoxDecoration(                
                    shape: BoxShape.circle,
                    color: purpleLight,
                    border: Border.all(color: Colors.white38,width: 1,style:BorderStyle.solid)
                  ),
                child: CircleAvatar(
                backgroundImage:widget.img!=""? Image.memory(base64Decode(widget.img),fit: BoxFit.cover,).image:ExactAssetImage("images/AddStory.png"),
                backgroundColor: purpleLight,
                radius: 30,      
                ),
              ),
            ),
          ),
        ),
        Text(widget.name, style: TextStyle(color: enabletextdark),),
      ],
    );
  }
}