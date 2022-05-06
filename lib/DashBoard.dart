import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad/profile1.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        backgroundColor:  Color(0xffffffff),

        actions: [
          IconButton(
            icon: Image.asset('assets/image/caru-logo-avatar-2 1.png',height: 60,
                width: 60,alignment: Alignment.topLeft,),
            onPressed: () =>   Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile1(),

              ),
          ),
          ),],



        elevation: 0,

      ),

      backgroundColor: Color(0xffffffff),

      body: Container(

        child: ListView(


          children: <Widget>[
            SizedBox(height: 10),
            Padding(


                padding: EdgeInsets.only( right: 16,left: 16),

                    child: Image.asset('assets/image/caru-logo.png'),


            ),
            SizedBox(height: 40),
            Padding(

              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text('Vital Signs',
                style: const TextStyle(
                  fontSize: 25.0,fontWeight: FontWeight.bold,
                  color: Color(0xcc0d0e11),)

              ),


            ),
            SizedBox(height: 40),

          Container(
            height: 300,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(

                children: <Widget>[
                  Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only( right: 16),
                            padding: EdgeInsets.only( left: 16),
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xcc00c3e9),
                              borderRadius:BorderRadius.circular(20),
                              border: Border.all(color: Colors.white30,width: 1),



                            ),
                            child: Row(
                                children: <Widget>[
                                 // Image.asset('assets/image/pulse.png', fit: BoxFit.contain),

                                  Padding(padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Pulse',
                                          style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.w500, color: Colors.white60),
                                          //  Text('55')

                                        ),


                                        Text('55 BPM',
                                            style: TextStyle(fontSize: 30,
                                                fontWeight: FontWeight.bold,color: Color(
                                                    0xE6FFFFFF))),


                                      ]

                                  )
                                  ),

                                ]

                            ),



                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only( right: 16),
                            padding: EdgeInsets.only( left: 16),
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xcc00c3e9),
                              borderRadius:BorderRadius.circular(20),
                              border: Border.all(color: Colors.white30,width: 1),



                            ),
                            child: Row(
                                children: <Widget>[
                                //  Image.asset('assets/image/pulse.png', fit: BoxFit.contain),

                                  Padding(padding: EdgeInsets.only(left: 16),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Temperature',
                                              style: TextStyle(fontSize: 20,
                                                  fontWeight: FontWeight.w500, color: Colors.white60),
                                              //  Text('55')

                                            ),


                                            Text('55 C',
                                                style: TextStyle(fontSize: 30,
                                                    fontWeight: FontWeight.bold,color: Color(
                                                        0xE6FFFFFF))),

                                          ]

                                      )
                                  ),

                                ]

                            ),



                          ),
                        )

                      ]
                  ),
                  SizedBox(height: 16),
                  Row(
                      children: <Widget>[


                      ]
                  ),



                ]
            )


          )

          ]

        ),


      ),







    );
  }
}

