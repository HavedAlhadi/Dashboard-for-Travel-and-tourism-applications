import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/responsive_layout.dart';
import 'package:flutter/material.dart';

List<String> _buttonNames = [
  "الرئيسية",
  "العملاء",
  "الحسابات",
  "الرسائل"
];
int _currentSelectedButton = 0;
class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(kPadding),
              height: double.maxFinite,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: Image.asset("images/haved.png"),
              ),
            )
          else
            IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          SizedBox(width: kPadding),
          if (ResponsiveLayout.isComputer(context))
            OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(kPadding / 2),
                child: Text("Haved Dashbord"),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(color: Colors.white, width: 0.4)),
            ),
          Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentSelectedButton = index;
                  });
                },                
                child: Padding(
                  padding: const EdgeInsets.all(kPadding * 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _currentSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                          fontSize: 12,
                          fontFamily: "Cairo",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(kPadding / 2),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: _currentSelectedButton == index
                              ? LinearGradient(
                                  colors: [
                                    red,
                                    orange,
                                  ],
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          red,
                          orange,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: EdgeInsets.all(kPadding),
              height: double.maxFinite,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: orange,
                radius: 30,
                backgroundImage: AssetImage(
                  "images/profile.png",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
