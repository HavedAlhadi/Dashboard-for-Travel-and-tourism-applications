import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:kayan_controle/widget_tree.dart';

class ButtonsInfo {
  String title;
  IconData icon;
  ButtonsInfo({required this.title, required this.icon});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({required this.task, required this.taskValue, required this.color});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "الرئيسية", icon: Icons.home),
  ButtonsInfo(title: "العملاء", icon: Icons.group),
  ButtonsInfo(title: "الحسابات", icon: Icons.link),
  ButtonsInfo(title: "الدرداشة", icon: Icons.chat_bubble),
  ButtonsInfo(title: "حفيد تك", icon: Icons.developer_board),

];

class DrawerPage extends StatefulWidget {
  final int i;
  const DrawerPage({Key? key, required this.i}) : super(key: key);
  @override
  _DrawerPageState createState() => _DrawerPageState(this.i);
}

class _DrawerPageState extends State<DrawerPage> {
  _DrawerPageState(int i) {
    _currentIndex = i;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: purpleLight,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            children: [
              Container(               
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kPadding * 2),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: ExactAssetImage("images/lcon.png"),
                        radius: 80,
                      ),
                    ),
                  ],
                ),
              ),
              //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
              // buttuns Forms
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            height: 49,
                            width: index == _currentIndex
                                ? (KnowDevisce(context))
                                : 0,
                            right: 0,
                            child: Container(
                              decoration: index == _currentIndex
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        colors: [
                                          red.withOpacity(0.9),
                                          orange.withOpacity(0.9),
                                        ],
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          ListTile(
                            trailing:  Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                  index == _currentIndex?Icons.circle_rounded:Icons.circle_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            ),
                            title: Text(
                              _buttonNames[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:15,                               
                              ),
                            ),
                            leading: Padding(
                              padding:
                                  const EdgeInsets.all(kPadding - 5),
                              child: Icon(
                                _buttonNames[index].icon,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              if(ActivePage!=index)
                              {
                                if(index==0)
                                Navigator.of(context).pushReplacementNamed("Home");
                                else if(index==1)
                                Navigator.of(context).pushReplacementNamed("Customers"); 
                                 else if(index==2)
                                Navigator.of(context).pushReplacementNamed("Accont"); 
                                 else if(index==3)
                                Navigator.of(context).pushReplacementNamed("Chat");
                                else if(index==4)
                                {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed("Haved");
                                }                                                                                                
                              setState(() {
                                _currentIndex = index;
                              });                                                            
                              }
                              else
                              {
                                Navigator.pop(context);
                              }
                              //
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

KnowDevisce(BuildContext context) {
  if (ResponsiveLayout.isComputer(context)) {
    return 330.0;
  } else if (ResponsiveLayout.isLargeTablet(context)) {
    return 263.0;
  } else if (ResponsiveLayout.isTablet(context)) {
    return 260.0;
  } else {
    return 259.0;
  }
}
