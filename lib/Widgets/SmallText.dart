import 'package:flutter/cupertino.dart';
import 'package:grad/MainPage/Colors.dart';

class SmallText extends StatelessWidget {

  Color? color;
  final String text;
  double size;
double height ;

  SmallText({Key? key, this.color =  const Color(0xffB2BAC6)
  , required this.text
    , this.size=12
  , this.height = 1.2}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      style: TextStyle(fontFamily: 'Roboto',
  color: color,
  height: height
 ),


    );
  }
}
