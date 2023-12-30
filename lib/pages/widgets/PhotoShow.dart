import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Accounts/AccountsEditor.dart';
import 'package:kayan_controle/pages/Screen/Customers/CustomersEdite.dart';
import 'dart:io';

File? imageUp;
Uint8List? Imagebyets;
class ditelsServicesPhoto extends StatefulWidget {
   ditelsServicesPhoto({
    Key? key,
    required this.size,
    required this.img,required this.typeData,    
  }) : super(key: key);
  final Size size;
  final String img;
  final int typeData;  
  @override
  State<ditelsServicesPhoto> createState() => _ditelsServicesPhotoState();
}

class _ditelsServicesPhotoState extends State<ditelsServicesPhoto> {
  File? Myimage;
  Image? imageSelectedNew;
  final ImagePicker imageFile = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: widget.size.width * 0.8,
            width: widget.size.width * 0.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                (widget.img!=""&&imageSelectedNew==null)? Positioned(
                  top: widget.size.width / 20,
                  left: widget.size.width / 20,
                  height: widget.size.width * 0.7,
                  width: widget.size.width * 0.7,
                  child: Container(
                     decoration: BoxDecoration(                
                    shape: BoxShape.circle,
                    border: Border.all(color: orange,width: 1.5,style:BorderStyle.solid)),                  
                    child: CircleAvatar(
                      backgroundImage: Image.memory(base64Decode(widget.img),fit: BoxFit.cover,).image,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ):
                 Positioned(
                  top: widget.size.width / 20,
                  left: widget.size.width / 20,
                  height: widget.size.width * 0.7,
                  width: widget.size.width * 0.7,
                  child: CircleAvatar(
                    backgroundImage: imageSelectedNew!=null?imageSelectedNew!.image:ExactAssetImage("images/AddStory.png"),
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  right: widget.size.width / 10,
                  bottom: widget.size.width / 15,
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: purpleDark,
                      radius: 30,
                      child: Icon(
                        Icons.edit,
                        size: 40,
                        color: orange,
                      ),
                    ),
                    onTap: () {
                      FormSelectedPhoto(context, "رفع صورة");
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colorDot(
                    fillColor: disabletextledark, isSelected: true),
              colorDot(fillColor: blue, isSelected: false),                
              colorDot(
                    fillColor: enabletextdark, isSelected: false),                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> FormSelectedPhoto(BuildContext context, String name) {
    return showModalBottomSheet(
        backgroundColor: purpleLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        )),
        context: context,
        builder: (context) {
          return Container(
            height: 180,
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                        color: enabletextdark,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                    textDirection: TextDirection.rtl,
                  ),
                  leading: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        size: 30,
                        color: disabletextledark,
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: enabletextdark,
                                child: CircleAvatar(
                                  backgroundColor: purpleLight,
                                  radius: 27,
                                  child: Icon(
                                    Icons.photo,
                                    size: 26,
                                    color: orange,
                                  ),
                                ),
                              ),
                              onTap: selecteimageDilogFromGallery,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                "المعرض",
                                style: TextStyle(
                                    color: enabletextdark,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: enabletextdark,
                                  child: CircleAvatar(
                                    backgroundColor: purpleLight,
                                    radius: 27,
                                    child: Icon(
                                      Icons.camera,
                                      size: 26,
                                      color: orange,
                                    ),
                                  ),
                                ),
                                onTap: selecteimageDilogFromCamera),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                "الكيمرة",
                                style: TextStyle(
                                    color: enabletextdark,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }


  //دالة إختيار صورة 
 Future selecteimageDilogFromGallery() async{
    try {
      final XFile? image = await imageFile.pickImage(source: ImageSource.gallery);
    if(image!=null)
    {
      final Myim=File(image.path);
      this.Myimage=Myim;
      imageUp=  File(image.path);
      Imagebyets=File(imageUp!.path).readAsBytesSync();
      setState(() {
      imageSelectedNew=Image.file(File(this.Myimage!.path));
      switch (widget.typeData)
      {
         case 0:
            NewCust.ImageTrans=base64Encode(Imagebyets!); 
            break;    
            case 1:
            NewAccont.image=base64Encode(Imagebyets!); 
            break;                
      }
     });
     Navigator.pop(context);
    } 
    }
    catch(ex){}      
  }

  //دالة إلتقاط صورة من الكيمرة
  Future selecteimageDilogFromCamera() async{
    try {
      final XFile? image = await imageFile.pickImage(source: ImageSource.camera);
        if(image!=null)
        {
          final Myim=File(image.path);
          this.Myimage=Myim;
          imageUp=  File(image.path);
          Imagebyets=File(imageUp!.path).readAsBytesSync();
          setState(() {
          imageSelectedNew=Image.file(File(this.Myimage!.path));
          switch (widget.typeData)
          {   
            case 0:
            NewCust.ImageTrans=base64Encode(Imagebyets!); 
            break;    
            case 1:
            NewAccont.image=base64Encode(Imagebyets!); 
            break;        
          }
        });
        Navigator.pop(context);
    } 
    }
    catch(ex){}  }
}


//كلاس 
class colorDot extends StatelessWidget {
  const colorDot({
    Key? key,
    required this.fillColor,
    required this.isSelected,
  }) : super(key: key);
  final Color fillColor;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kPadding / 2.5),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? orange : Colors.transparent)),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: fillColor),
      ),
    );
  }
}
