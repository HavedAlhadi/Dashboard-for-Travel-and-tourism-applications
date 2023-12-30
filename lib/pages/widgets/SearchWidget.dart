import 'package:flutter/material.dart';
import 'package:kayan_controle/constants.dart';
import 'package:kayan_controle/pages/Screen/Customers/Customers.dart';
class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,required this.Function,
  }) : super(key: key);

  final Function;





  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kPadding),
      padding: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: purpleDark,
        border: Border.all(color: orange, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        onChanged: (value) => Function(value),
             textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          suffixIcon: Container(
            width: 80,
            height: 45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  red.withOpacity(0.9),
                  orange.withOpacity(0.9),
                ],
              ),
              //border: Border.all(color: orange, width: 5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: enabletextdark,
                size: 20,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          border: InputBorder.none,
          hintText: 'بحث',          
          hintStyle: TextStyle(color: orange, fontSize: 20,),
        ),
        style: TextStyle(color: enabletextdark),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
