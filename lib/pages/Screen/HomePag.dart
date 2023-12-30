import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayan_controle/Thame.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/StoryAds/AlartDilog.dart';
import 'package:kayan_controle/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Data.dart';
import 'StoryAds/Stories.dart';


GlobalKey<AnimatedListState> akey=GlobalKey<AnimatedListState>();
class PanelLeftPage extends StatefulWidget {  
  @override
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  int indexx=0; 
  File? imageUp;
  Uint8List? Imagebyets;
  Image? imageSelectedNew;
  final ImagePicker imageFile = ImagePicker();
  @override
 void initState() {    
    super.initState();
  }

//فتح المعرض للاختيار
  Future _selecteimageDilog( int index) async{
    try {
      final XFile? image = await imageFile.pickImage(source: ImageSource.gallery);
    if(image!=null)
    {
      imageUp=  File(image.path);
      Imagebyets=File(imageUp!.path).readAsBytesSync();
      setState(() {
        showDialog(context: context,builder: (BuildContext context){
              return EditeAds(idFir: "",image:  base64Encode(Imagebyets!),index: index,name: "",);
          } ).then((value) => setState(() {}));      
     });     
    } 
    }
    catch(ex){}      
  }
  
  setbool(bool d)async
  {
      try
      {
      SharedPreferences shar= await SharedPreferences.getInstance();
      shar.setBool("Mode",d);                                                                    
      }
      catch(es){
      //  print(DarkMode.toString()+"Mode");
      }                 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: purpleLight,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                //Widget for reports
                Padding(
                  padding: const EdgeInsets.only(
                      left: kPadding / 2,
                      top: kPadding / 2,
                      right: kPadding / 2),
                  child: Card(
                    color: purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        //leading: Icon(Icons.shopping_basket),
                        title: Text(
                          "إجمالي المستخدمين",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          " بحوالي "+(InterfaceControlslist[0].TotalU /100).toString()+"  % ",
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Chip(
                          backgroundColor: Colors.black45,
                          label: Text(
                            InterfaceControlslist[0].TotalU.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

               //widget for Stories Ads  
               Padding(
                padding: const EdgeInsets.only(top: 2.0,bottom: 2.0,right: 8,left: 8),
                child: SizedBox(
                  height: 120,                  
                  child: AnimatedList(
                    scrollDirection: Axis.horizontal,
                    //shrinkWrap: true,                    
                    key: akey,
                    initialItemCount: Mstories.length,
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                        axis: Axis.horizontal,
                        sizeFactor: animation,
                        child:MyStory(    
                        index: index,                    
                        function: (){
                          if(index==0)
                          _selecteimageDilog(index);
                          else
                          {
                            setState(() {
                              showDialog(context: context,builder: (BuildContext context){
                                    return EditeAds(idFir: Mstories[index].Id,image:  Mstories[index].img,index: index,name: Mstories[index].name,);
                                }).then((value) => 
                                setState(() {                                  
                                }));                                
                          });
                        }
                        },
                        img: Mstories[index].img,
                        name: Mstories[index].name,                        
                                            ));
                      },
                  )
                ),
              ),
                // //الرسم
                PieChartSample2(),
                // //++++++++++++++++++++++++++

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Card(
                    color: purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "الاستعلام برقم الجواز",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Switch(
                                value: InterfaceControlslist[0].enableSelect,
                                onChanged: (val) {
                                  setState(() {
                                    InterfaceControlslist[0].enableSelect = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Card(
                    color: purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "الوضع الليلي",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Switch(
                                value:
                                DarkMode,
                                onChanged: (val) {                                  
                                   setState(() {                                    
                                    DarkMode=val;
                                    getThame(DarkMode);                  
                                                                                        
                                  });    
                                  Get.isDarkMode?
                                  Get.changeTheme(MyThame.lightThemeData(context)):
                                  Get.changeTheme(MyThame.darkThemeData(context));                                                                                                                                                      
                                  setbool(DarkMode);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),                    
              ],
            ),
          ),
        ],
      ),
    
    );
  }  
}
//أداة التقرير عن محتوى البرنامج
class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kPadding / 2,
          bottom: kPadding,
          right: kPadding / 2),
      child: Card(
        color: purpleLight,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          final desiredTouch = pieTouchResponse.touchInput
                                  is! PointerExitEvent &&
                              pieTouchResponse.touchInput is! PointerUpEvent;
                          if (desiredTouch &&
                              pieTouchResponse.touchedSection != null) {
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          } else {
                            touchedIndex = -1;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'الخدمات',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'الشركاء',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xffff5182),
                  text: 'الفروع',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'الإستعلامات',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
//تقسيم الدائرة حسب المحتوى
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(            
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffff5182),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: (InterfaceControlslist[0].TotaSelsct/100),
            title: (InterfaceControlslist[0].TotaSelsct/100).toString()+"%",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = Colors.white70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );  
  }
  
}
