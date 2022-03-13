import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/MainPage/Colors.dart';
import 'package:grad/Widgets/BigTexts.dart';
import 'package:grad/Widgets/SmallText.dart';

import 'HomePageBody.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
        onPressed: () {},
    icon: image.asset("assets/icons/menu.svg"),
    ),
    title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    image.asset("assets/icons/Location.svg"),
    const SizedBox(width: defaultPadding / 2),
    Text(
    "15/2 New Texas",
    style: Theme.of(context).textTheme.bodyText1,
    ),
    ],
    ),
      body: SingleChildScrollView(
        child: Column(

          children: [Container(
              child: Container(
                margin: EdgeInsets.only(top: 45,bottom: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),



                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [


Row(children: [

  Icon(Icons.person, color: AppColors.BigTextColor),
                        Column(
                          children: [

                            BigText(text:"Mohammed Aldossari" , color: AppColors.BigTextColor, size:20 ,),
                          SmallText(text: "    Male, 19 June (3 months old)", color: AppColors.FadingTextColor, size: 10,),




                          ],

                        ),],), //colum
                        Center(
                          child: Container(

                              width: 45,
                              height: 45,

                              child: Icon(Icons.notifications, color: AppColors.BigTextColor),
                             // decoration: BoxDecoration(

                              //    borderRadius: BorderRadius.circular(15),
                               //   color:  Colors.blueAccent
                            //  )
                          ),
                        )
                      ]


                  )
              )

          )

            ,  HomePageBody(), //HomePageBody(),
          ],
          

        ),

            )
         );
  }
}
