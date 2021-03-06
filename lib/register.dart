// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_import, avoid_print, avoid_web_libraries_in_flutter



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/otp.dart';
//import 'package:flutter_application_1/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad/DashBoard.dart';
import 'package:grad/signup.dart';

import 'package:grad/welcome.dart';



class Register extends StatefulWidget {

  const Register({Key? key}) : super(key: key);
 
  @override

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;
   bool SignUpVisibility = true;

  String verificationID = "";

  // TextEditingController phoneController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff) ,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [

              
                Image.asset('assets/image/caru-logo.png', width:240) ,


              
              SizedBox(
                height: 18,
              ),
              Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter your phone number",
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
                  color:Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      
                      keyboardType: TextInputType.number,
                      controller: phoneController, //
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      decoration: InputDecoration(
                        hintText: '55 555 5555',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '(+966)',
                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                           ),
                      ), 
                      suffixIcon: Icon(
                        Icons.check_circle,
                         color: Colors.green, 
                         size: 32, 
                         ),


                      ),

                    ),
                    //

                    Visibility(
                      child: TextField(

                        controller: otpController,
                        decoration: InputDecoration(
                          hintText: 'OTP',
                          prefix: Padding(

                            padding: EdgeInsets.all(4),
                            child: Text(''),
                          ),
                        ),
                        maxLength: 6,
                        keyboardType: TextInputType.number,

                     ),
                     visible: otpVisibility,
                    ),
                    
                    SizedBox(

                      height: 10,
                    ),
                   
                    MaterialButton(
                      
                      color: Color(0xff00c3e9),
                      
                      onPressed: () {setState(() {
                        SignUpVisibility = !SignUpVisibility;
                      });
                        if (otpVisibility) {
                          verifyOTP();
                        } else {
                           loginWithPhone();
                          }
                      },
                      
                      
                      child: Text(

                        otpVisibility ? "Verify" : "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        
                        
                      ),
                      
                    ),

                    //
                   // SizedBox(
                    //  height: 22,
                    //),



                  ],


                ),


              ),

             Visibility(
               visible: SignUpVisibility,
               child: RichText(
        text: TextSpan(
        text: "Don't have an account yet? ",
            style: TextStyle(color: Colors.black, fontSize: 14.0, ),

        children: <TextSpan>[

          TextSpan(
                text: ' Sign up now!',
                style: const TextStyle(
                 fontWeight: FontWeight.bold,
                 ),

                recognizer: TapGestureRecognizer()
                  ..onTap = () {  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signup(),
                    ),);} ),
        ],
      ),
      ),
             ),

            ],
          ),
        ),
      ),
    );
  }
   void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+966" + phoneController.text,

      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are signed in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        print("You are logged in successfully");
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xa32b2929),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
        );
      },
    );
  }
}
 