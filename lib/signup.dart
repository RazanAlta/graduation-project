// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, avoid_print, unused_import, prefer_final_fields, unnecessary_import, unnecessary_null_comparison, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_application_1/profile1.dart';
//import 'package:flutter_application_1/register.dart';
//import 'package:flutter_application_1/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad/profile1.dart';
import 'package:grad/register.dart';
//import 'package:flutter_application_1/main.dart';




class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
 
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Signup> {
   TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();


  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData(){
   final User? user = auth.currentUser;
   final uid = user?.uid;
  }
  

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool otpVisibility = false;
   bool SignInVisibility = true;

  String verificationID = "";
  var _text = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // TextEditingController phoneController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
      resizeToAvoidBottomInset: false,
      backgroundColor: Color((0xffffffff)) ,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [

              
                Image.asset(
                  'assets/image/caru-logo.png',
                 width:240,
                ),
              
              SizedBox(
                height: 18,
              ),
              Text(
                "Registration",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter your information",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 14,
                   color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
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
                      
                      keyboardType: TextInputType.name,
                      controller: _text,
                       //
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                     
                      ),
                    ),
                    SizedBox(height: 18,),
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
                      
                      color: Color(0xcc00c3e9),
                      
                      onPressed: () {setState(() {
                        SignInVisibility = !SignInVisibility;
                      });
                        if (otpVisibility) {
                          
                          verifyOTP();
                         // checkForFirstTime(userid);
                          //
                        } else {
                           loginWithPhone();
                          }
                      },
                      
                      
                      child: Text(

                        otpVisibility ? "Verify" : "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        
                        
                      ),
                      
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: SignInVisibility ,
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 14.0),

                          children: <TextSpan>[

                            TextSpan(
                                text: ' sign in now!',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),

                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ),);} ),
                          ],
                        ),
                      ),
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
   void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+966" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
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
      (value) async {
        
        User? user = FirebaseAuth.instance.currentUser;
        
        if(user?.uid == null){
          await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
          'uid': user?.uid,
          'name':_text.text 
           
         
          });
          storeNewUser(auth.currentUser);
          FirebaseAuth.instance.currentUser!.updateProfile(displayName:_text.text);
        print("You are logged in successfully");
        
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
            Fluttertoast.showToast(
          msg: "User added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Profile1(),
          ),
        );
        }
        else{
          Fluttertoast.showToast(
          msg: "User already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Register(),
          ),
        );
        }
      },
    );
  }
     storeNewUser(user) async {
     final User? user = auth.currentUser;
   final uid = user?.uid;
    var firebaseUser = await user;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set({'uid': user?.uid,'name': user?.displayName})
        .then((value) {})
        .catchError((e) {
          print(e);
        });
  }
}
 