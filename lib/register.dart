import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_package_flutter/main.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';





class REGISTER extends StatelessWidget {
  const REGISTER({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: register(),
        theme: ThemeData(
            primarySwatch: Colors.deepOrange
        )
    );
  }

}
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController mail=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController name=TextEditingController();

  var an=true;
  final _formkey=GlobalKey<FormState>();
  late ProgressDialog progressDialog;
  late FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
      appBar: AppBar(
        title: Text("LAW BOT"),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("SMVEC",style: GoogleFonts.farro(fontSize: 50),),
            ),
            ListTile(
              title: Text("HOME",style: GoogleFonts.abrilFatface(fontSize: 25),),
            ),
            ListTile(
              title: Text("ABOUT US",style: GoogleFonts.abrilFatface(fontSize: 25),),
            ),

            ListTile(
              title: Text("FOR FURTHER DETAILS",style: GoogleFonts.abrilFatface(fontSize: 25),),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent,Colors.lightBlueAccent
                      ],begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  )
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 150),
                child: Image.asset("assets/user.png",width: 100,),
              ),

            ),
            Container(
              margin: EdgeInsets.all(20),
              transform: Matrix4.translationValues(0.0, -100.0, 0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(


                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key:_formkey,
                      child: Column(

                        children: [
                          Text("REGISTER PAGE",style: GoogleFonts.allerta(
                              fontSize: 20
                          ),),
                          SizedBox(height: 30,),

                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                    ,width: 2
                                ),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                    ,width: 2
                                ),

                              ),
                              hintText: "ENTER YOUR NAME",
                              labelText: "NAME",
                              suffixIcon: IconButton(onPressed: (){
                                mail.text="";
                              },icon: Icon(Icons.explore_off_rounded),),


                            ),
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return "PLSE FILL THIS FIELD";
                              }

                            },


                          ),
                          SizedBox(
                            height: 20,
                          ),




                          TextFormField(
                            controller: mail,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                    ,width: 2
                                ),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                    ,width: 2
                                ),

                              ),
                              hintText: "ENTER YOUR EMAIL ID",
                              labelText: "EMAIL ID",
                              suffixIcon: IconButton(onPressed: (){
                                mail.text="";
                              },icon: Icon(Icons.explore_off_rounded),),


                            ),
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return "PLSE FILL THIS FIELD";
                              }

                            },


                          ),

                          SizedBox(height: 20,),

                          TextFormField(
                            controller: pass,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                    ,width: 2
                                ),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                    ,width: 2
                                ),

                              ),
                              hintText: "ENTER YOUR PASSWORD",
                              labelText: "PASSWORD",


                              suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  if(an)
                                  {
                                    an=false;
                                  }
                                  else
                                  {
                                    an=true;
                                  }
                                });
                              },icon: Icon(Icons.remove_red_eye),),


                            ),
                            obscureText: an,
                            validator: (value){
                              if(value!.isEmpty)
                              {
                                return "PLSE FILL THIS FIELD ";
                              }

                            },


                          ),

                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),


                ),
              ),
            )
            ,Container(transform: Matrix4.translationValues(0, -155, 0),
                width: 250,
                height: 50,
                child: ElevatedButton(onPressed: ()
                async   {
                  if(_formkey.currentState!.validate())
                  {
                    progressDialog=ProgressDialog(context,type: ProgressDialogType.normal);
                    progressDialog.style(
                        message: "PLSE WAIT WHILE PROCESSING"
                    );
                    progressDialog.show();

                    registerfunc(mail.text,pass.text);




                  }


                }

                  , child: Text("REGISTER"),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),))


          ],
        ),
      ),
    );
  }

  Future registerfunc(String email,String password) async
  {
try{
    User? user=( await auth.createUserWithEmailAndPassword(email:email, password: password)).user!;
    if(user!=null)
      {
        print("ACCOUNT REGISTERED SUCCESSFULLY WITH NO PROBLEMS");


        Map<String,dynamic> map={};
        map["email"]=email;
        map["user_id"]=user.uid;
        map['name']=name.text;
        await FirebaseFirestore.instance.collection("USER DETAILS").doc().set(map) ;

      progressDialog.hide();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));


        user.updateDisplayName(name.text);
      }




}

on FirebaseAuthException catch(e)
{
    print(e.toString());
    if(e.code=='weak-password')
      {
        Fluttertoast.showToast(msg: "WEAK PASSWORD");
      }
    else if(e.code=='email-already-in-use')
      {
        Fluttertoast.showToast(msg: "EMAIL ALREADY IN USE");
      }

}






  }
}

















/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:smvec_manafgemt_app/home.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';




class REGISTER extends StatelessWidget {
  const REGISTER({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: register(),
        theme: ThemeData(
            primarySwatch: Colors.deepOrange
        )
    );
  }

}
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController mail=TextEditingController();
  TextEditingController pass=TextEditingController();
  var an=true;
  final _formkey=GlobalKey<FormState>();
  late ProgressDialog progressDialog;
  late FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
      appBar: AppBar(
        title: Text("SMVEC PARENTS"),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("SMVEC",style: GoogleFonts.farro(fontSize: 50),),
            ),
            ListTile(
              title: Text("HOME",style: GoogleFonts.abrilFatface(fontSize: 25),),
            ),
            ListTile(
              title: Text("ABOUT US",style: GoogleFonts.abrilFatface(fontSize: 25),),
            ),

            ListTile(
              title: Text("FOR FURTHER DETAILS",style: GoogleFonts.abrilFatface(fontSize: 25),),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  "REGISTER PAGE",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.abrilFatface(
                    fontSize: 30
                  ),

                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Image.asset("assets/llo.png"),
                )

                ,
                Container(
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: mail,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                                ,width: 2
                            ),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue
                                ,width: 2
                            ),

                          ),
                          hintText: "ENTER YOUR EMAIL ID",
                          labelText: "EMAIL ID",
                          suffixIcon: IconButton(onPressed: (){
                            mail.text="";
                          },icon: Icon(Icons.explore_off_rounded),),


                        ),
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "PLSE FILL THIS FIELD";
                          }
                          return null;
                        },


                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pass,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                                ,width: 2
                            ),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue
                                ,width: 2
                            ),

                          ),
                          hintText: "ENTER YOUR PASSWORD",
                          labelText: "PASSWORD",


                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              if(an)
                              {
                                an=false;
                              }
                              else
                              {
                                an=true;
                              }
                            });
                          },icon: Icon(Icons.remove_red_eye),),


                        ),
                        obscureText: an,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "PLSE FILL THIS FIELD ";
                          }
                              return null;
                        },


                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate())
                    {
                         progressDialog=ProgressDialog(context,type: ProgressDialogType.normal);
                        progressDialog.style(
                          message: "PLSE WAIT WHILE PROCESSING"
                        );
                        progressDialog.show();

                      registerfunc(mail.text,pass.text);

                    }


                }, child: Text("SIGN UP")),
                SizedBox(height: 30,)
                ,

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registerfunc(String email,String password) async
  {
try{
  await auth.createUserWithEmailAndPassword(email:email, password: password);
  progressDialog.hide();
  Navigator.push(context, MaterialPageRoute(builder: (context)=>HOME()));

}

on FirebaseAuthException catch(e)
{
    print(e.toString());
    if(e.code=='weak-password')
      {
        Fluttertoast.showToast(msg: "WEAK PASSWORD");
      }
    else if(e.code=='email-already-in-use')
      {
        Fluttertoast.showToast(msg: "EMAIL ALREADY IN USE");
      }

}






  }
}

 */