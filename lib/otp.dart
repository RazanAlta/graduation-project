// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_is_empty, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_import, unused_field, avoid_print, unused_element, prefer_final_fields



import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/welcome.dart';
//import 'package:flutter_application_1/welcome.dart';
import 'package:pinput/pinput.dart';


class Otp extends StatefulWidget {
 final String phone;
  Otp(this.phone);
 

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode = " ";
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     return Scaffold( 
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb) ,
      body:
      
      
       SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap:() {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 35,
                      
                    ),
                  ),
                ),
              
                Image.asset(
                  'images/Ask-the-midwife-logo.png',
                 width:240,
                ),
              
              SizedBox(
                height: 18,
              ),
              Text(
                "Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter the verification code sent to your phone number",
                
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 14,
                   color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 38,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Color(0xfff7f6fb),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     
                      children: [
                         
                     _textFieldOTP(first: true, last: false),
                     _textFieldOTP(first: false, last: false),
                     _textFieldOTP(first: false, last: false),
                     _textFieldOTP(first: false, last: true),
                     
                      ],
                      
                    ),
                    SizedBox(
                height: 22,
              ),
               
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>(Welcome()),
                      ),
                    );
                   
                  },
                  style: ButtonStyle(
                    foregroundColor: 
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Verify',
                       style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
                  
                   
                  ],
                ),
              ),
               
              SizedBox(
                height: 18,
              ),
              Text(
                "I didn't receive the code",
                style: TextStyle(
                   fontSize: 18, 
                   fontWeight: FontWeight.bold, 
                   color: Colors.grey,
                ),
              ),
              
              SizedBox(
                height: 18,
              ),
              Text(
                "Resend New Code", 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _textFieldOTP({bool? first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          
          autofocus: true,
          onChanged: (value){
            if(value.length == 1 && last == false){
              FocusScope.of(context).nextFocus();
            }
            if(value.length == 0 && first == false){
              FocusScope.of(context).previousFocus();

            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 24), 
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color:  Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color:  Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
          ),    
        ),
      ),
    );
  }

 
}

 