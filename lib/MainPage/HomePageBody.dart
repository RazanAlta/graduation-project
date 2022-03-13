//import 'dart:html';

//import 'dart:html';
//import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as html;

import 'package:flutter/cupertino.dart';
import 'package:grad/MainPage/dimensions.dart';
import 'package:grad/Widgets/BigTexts.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
        height: 322,
        width:312 ,
child: PageView.builder(
  itemCount: 1,
  itemBuilder: (context, position){
      return _buildPageItem(position);

  }

),

),
          SizedBox(height: 40),
          Container(
margin: EdgeInsets.only(left: 20),
          //  margin: EdgeInsets.only(left: Dimensions),
            child: Row(
         children: [
           BigText(text: "Vital signs")


         ],


            )
          ),
          //list of boxes of vital signs

          Container(


            height: 900,


            child: ListView.builder(

                itemCount: 2,

                itemBuilder: (context , index){

                  return Container(

                  //  margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),

                    child: Row(

                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          width:157,
                          height: 70,
                          //padding: s,
                          decoration: BoxDecoration(
                            //radius for the contsiners
                              borderRadius: BorderRadius.circular(20),

                              color: Colors.cyan,
                              image: const DecorationImage(

                                  image: AssetImage(
                                      "assets/image/pulse.png"

                                  )

                              )
                          ),

                        )
                        , Container(
                          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          width:157,
                          height: 70,
                          //padding: s,
                          decoration: BoxDecoration(
                            //radius for the contsiners
                              borderRadius: BorderRadius.circular(20),

                              color:Colors.blue,
                              image: const DecorationImage(

                                  image: AssetImage(
                                      "assets/image/pulse.png"

                                  )

                              )
                          ),

                        )

                      ],

                    ),
                  );
                }
            ),
          ),


          Container(

              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              height: 70,
              width: 300,

                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: new Center(
                  child: new Text("Status",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                    textAlign: TextAlign.center,),
                )),





        ],),
    );
  }
  Widget  _buildPageItem(int index){

    return Container(

      height: 220,
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10)
            , color: const Color(0x00ffffff),
          image: const DecorationImage(

          image: AssetImage(

          "assets/image/baby.jpg"
      )
      )

      ),
    );


  }


}
