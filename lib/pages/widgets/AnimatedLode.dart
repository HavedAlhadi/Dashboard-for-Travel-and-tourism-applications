import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class AnimtLoded extends StatefulWidget {
  const AnimtLoded({Key? key, required this.id}) : super(key: key);
  final int id; 
  @override
  State<AnimtLoded> createState() => Animt_LodedState();
}

class Animt_LodedState extends State<AnimtLoded> {
  final spinkit = SpinKitWave(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.white : Colors.white,
      ),
    );
  },
);
	

final spinkit2 = SpinKitChasingDots(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.white : Colors.white,
      ),
    );
  },
);

final spinkit3 = SpinKitThreeBounce(
  color: Colors.white,
  size: 50.0,
);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,      
      child: Center(
          child: AnimtLodedBox(theChild:widget.id==1? spinkit:widget.id==0?spinkit2:spinkit3,theHeight: 200.0,theWidth: 200.0),
        ),      
      );
  }
}

class AnimtLodedBox extends StatelessWidget {
  const AnimtLodedBox(
      {Key? key,
      required this.theWidth,
      required this.theHeight,
      required this.theChild})
      : super(key: key);
  final double theWidth;
  final double theHeight;
  final theChild;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        //we use Stack(); because we want the effects be on top of each other,
        //  just like layer in photoshop.
        child: Stack(
          children: [
            //blur effect ==> the third layer of stack
            BackdropFilter(
              filter: ImageFilter.blur(
                //sigmaX is the Horizontal blur
                sigmaX: 4.0,
                //sigmaY is the Vertical blur
                sigmaY: 4.0,
              ),
              //we use this container to scale up the blur effect to fit its
              //  parent, without this container the blur effect doesn't appear.
              child: Container(),
            ),
            //gradient effect ==> the second layer of stack
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      //begin color  
                      Colors.white.withOpacity(0.15),
                      //end color
                      Colors.white.withOpacity(0.05),
                    ]),
              ),
            ),
            //child ==> the first/top layer of stack
            Center(child: theChild),
          ],
        ),
      ),
    );
  }
}