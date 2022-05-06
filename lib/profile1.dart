// ignore_for_file: prefer_const_constructors, file_names, unused_import, avoid_print, no_logic_in_create_state, override_on_non_overriding_member, unnecessary_import, unused_local_variable, prefer_final_fields, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_element, curly_braces_in_flow_control_structures, unnecessary_null_comparison, dead_code, non_constant_identifier_names, annotate_overrides, must_call_super, unused_field, await_only_futures, unnecessary_string_interpolations


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/otp.dart';
//import 'package:flutter_application_1/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_1/signup.dart';
//import 'package:flutter_application_1/main.dart';
class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Profile1> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;



  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool otpVisibility = false;

  String verificationID = "";

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  var _Fname = TextEditingController();

  void inputData(){
    final User? user = auth.currentUser;
    final uid = user?.uid;

    var userName = user?.displayName;
  }





  // function to fetch user name to be viwed.
  fetch() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final firebaseUser = await user;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.data()!['name'];
        print(userName);
      }).catchError((e) {
        print(e);
      });
  }

  String userName ="" ;
  @override

  Widget build(BuildContext context) {
    return Scaffold(




      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffffffff) ,

      appBar: AppBar(
        centerTitle: false,
        backgroundColor:  Color(0xffffffff),

        actions: [
          Align(
            child: IconButton(
              alignment:Alignment.bottomLeft ,
              icon:Icon(Icons.arrow_back, color: Colors.grey,
                size: 35,),
              onPressed: () =>   Navigator.pop(
                context,

              ),
            ),
          ),],




        elevation: 0,

      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
            /*  Align(
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
              ), */
          /*    Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  // function for logout and go back to first page
                  onTap:() async{
                    await auth.signOut().then((result) {
                      Navigator.of(context).pop(true);

                    });
                  },
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.grey,
                    size: 35,

                  ),
                ),
              ),*/



              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Edit or view your information",
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

                    // text field to take name as input to update data
                    TextFormField(

                      keyboardType: TextInputType.name,
                      controller: _Fname,

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),
                      decoration: InputDecoration(

                        hintText: " $userName",


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
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      // button to press when wanting to update name
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          UpdateData();
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xcc00c3e9)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Text(
                            'Update Information',
                            style: TextStyle(fontSize: 16),
                          ),
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

  // function to update user name
  UpdateData() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    final firebaseUser = await user;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(firebaseUser.uid)
          .update({'uid': user?.uid,'name': _Fname.text})
          .then((value) {})
          .catchError((e) {
        print(e);
      });
  }
  // function to signout
  Future SignOut() async{
    try{
      return auth.signOut();
    } catch(error){
      print(error.toString());
      return null;
    }
  }
}








