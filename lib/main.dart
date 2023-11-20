// //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
//
//
//
// import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main()
// {
//   runApp(MAin());
// }
//
// class MAin extends StatefulWidget {
//   const MAin({super.key});
//
//   @override
//   State<MAin> createState() => _MAinState();
// }
//
// class _MAinState extends State<MAin> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(appBar: AppBar(title: Text("Hi"),),),
//     );
//   }
// }
import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:http_package_flutter/register.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

Future <void> main() async
{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(SplashScreen());
}






class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedScreen(),
    );
  }
}


class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
    Column(
      children: [
       ClipRRect(
         borderRadius: BorderRadius.circular(20),


         child:  Image.asset("assets/law.jpg"),
       ),
        SizedBox(height: 20,),
        Text("YOUR LEGAL ASSISTANT",style: GoogleFonts.aBeeZee(
          fontSize: 30,
          color: Colors.white
        ),),




      ],
    ),backgroundColor: Colors.black,
      splashIconSize: 250,
      pageTransitionType: PageTransitionType.topToBottom,
      splashTransition: SplashTransition.sizeTransition,
      //rotationTransition:Rotate the image
      //fadeTransition:Fade the image
      //decoratedBoxTransition:change the background colour of transition

      nextScreen: Fun(),
    );
  }
}









class Fun extends StatefulWidget {
  const Fun({super.key});

  @override
  State<Fun> createState() => _FunState();
}



class _FunState extends State<Fun> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser!=null)?(App()):MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}






class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final formkey=GlobalKey<FormState>();
  TextEditingController mail=TextEditingController();
  TextEditingController pass=TextEditingController();
  var an=true;
  late ProgressDialog progressDialog;
  late FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold
    //
      (

        appBar: AppBar(
          title: Text("LAW BOT "),
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
        body:  SingleChildScrollView(
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
                margin: EdgeInsets.all(20)
                ,
                transform: Matrix4.translationValues(0.0, -100.0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(


                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Form(
                        key:formkey,
                        child: Column(

                          children: [
                            Text("LOGIN",style: GoogleFonts.allerta(
                                fontSize: 20
                            ),),
                            SizedBox(height: 30,),

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
                  {

                    if(formkey.currentState!.validate())
                    {
                      progressDialog=ProgressDialog(context,type: ProgressDialogType.normal);
                      progressDialog.style(
                          message: "PLSE WAIT WHILE PROCESSING"
                      );
                      progressDialog.show();
                      String a=mail.text;
                      String b=pass.text;
                      loginfunc(a,b);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));
                    }

                  }

                    , child: Text("LOGIN"),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),))

              ,Container(
                transform: Matrix4.translationValues(0, -130,0),
                child:   RichText(

                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black54,fontWeight: FontWeight.bold
                        ),
                        text: "DONT HAVE AN ACOUNT ? ",
                        children: [
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.pink
                              ),
                              text: "SIGN UP",
                              recognizer: TapGestureRecognizer()..onTap=()
                              {

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>REGISTER()));
                              }
                          )
                        ]
                    )),
              )
            ],
          ),
        )
    );
  }

  Future loginfunc(String email,String password) async {
    try{
      User? user=(  await _auth.signInWithEmailAndPassword(email: mail.text, password: pass.text)).user!;
      if(user!=null)
      {
        print(user);
        print("ACCOUNT LOGIN SUCCESSFULLY");


        progressDialog.hide();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));

      }







    }
    on FirebaseAuthException catch (e)
    {
      progressDialog.hide();
      Fluttertoast.showToast(msg: e.toString());
      if(e.code=='wrong-password')
      {
        Fluttertoast.showToast(msg: "WRONG PASSWORD");
      }
      else if(e.code=='invalid-email')
      {
        Fluttertoast.showToast(msg: "INVALID EMAIL");
      }
      else if(e.code=='user-disabled')
      {
        Fluttertoast.showToast(msg: "USER HAS DISABLED THE EMAIL ID");
      }
    }
  }
// bool isUserLoggedIn()
// {
//   return _auth.currentUser!=null;
// }
}











class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      home: Home(),

      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController question=TextEditingController();
var list=[];
var flag=0;
String ans=" ";
final SpeechToText _speechToText=SpeechToText();
// var length;
late ProgressDialog dialog;














class _HomeState extends State<Home> {
  getanswer(String a) async{

  try{
    print("Function called");
print(a);
    var response=await http.post(Uri.parse("https://stileschat-ai.p.rapidapi.com/api"),headers: {
      'Content-Type':'application/json',
      'X-RapidAPI-Key': 'f57d0797demsh1cd143822f6247fp185348jsnd47f87ec4638',
      'X-RapidAPI-Host': 'stileschat-ai.p.rapidapi.com'
    },body: jsonEncode(
      {
        'promptInput':a,
        'context':false

      }
    )


    );

    // var response=await http.post(Uri.parse("https://meta-llama-fast-api.p.rapidapi.com/mistralchat"),headers: {
    //
    //   'Content-Type': 'application/json',
    //   'X-RapidAPI-Key': 'f57d0797demsh1cd143822f6247fp185348jsnd47f87ec4638',
    //   'X-RapidAPI-Host': 'meta-llama-fast-api.p.rapidapi.com'
    // },body: jsonEncode(
    //   {
    //     "message":a
    //   }
    //
    // )
    //
    // );
    //
    //
    await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).doc().set(
      {
        "user-id":FirebaseAuth.instance.currentUser?.uid,
        "message":response.body,
        "type":"bot",
        "time":FieldValue.serverTimestamp()
      }
    ).whenComplete(() {

      dialog.hide();

    });
    print("RESPONSE IS ${response.body}");



  }

catch(e){
  throw e;
}

  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAccessSpeech();


  }




  bool isSpeechEnabled=false;
  getAccessSpeech() async{

    isSpeechEnabled=await _speechToText.initialize();
    print("Value of speech enabled ${isSpeechEnabled}");

  }


  void startListening() async
  {
      await _speechToText.listen(onResult: onSpeechResult);

  }

  void stopListening() async
  {
    await _speechToText.stop();
  }

  var spokenwords="";
  void onSpeechResult(result)
  {
    print("SPEAK FUNCTION CALLED");
    setState(() {
      spokenwords="${result.toString()}";
      print("answer is $spokenwords");

    });

    SpeechRecognitionResult recognitionResult=result;
    print(recognitionResult.recognizedWords);
    question.text=recognitionResult.recognizedWords;


    print("answer is $spokenwords");
  }




  @override
  Widget build(BuildContext context) {




    return Scaffold(

      appBar: AppBar(
        title: Text("ASK YOUR QUERIES"),actions: [

          IconButton(onPressed:(){
            delete();
          }, icon: Icon(FontAwesomeIcons.trash))
      ],
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

         Expanded(

           child:
          (FirebaseAuth.instance.currentUser?.uid==null)?(SizedBox()):StreamBuilder(stream:FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).orderBy("time",descending: false).snapshots()
             , builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


             if(snapshot.hasData)
               {

                  return ListView.builder(itemBuilder: (context,index){


                    final DocumentSnapshot documentSnapshot=snapshot.data.docs[index];

                    String result_string=documentSnapshot["message"].toString().replaceAll("\\n", "\n");

                    print("ANSWR IS ${result_string}");



                    return (documentSnapshot["type"]=="bot")?
                    (Container(
                      margin: EdgeInsets.only(top: 30,right: 40,left: 10),
                      alignment: Alignment.topLeft,

                      child: GestureDetector(

                        onTap: (){
                          print("SPEAKED WORDS $spokenwords");
                        },
                        child: Card(
                          elevation: 5,
                        shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
                        child: Container(

                          padding: EdgeInsets.all(15),
                          child: Text(result_string,style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.black),),),

                        ),
                      ),))

                        :(Container(


                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 10,right: 10,left: 40),
                      child: Card(
  color: Colors.grey,
  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
  topLeft: Radius.circular(20),
                 bottomRight: Radius.circular(20)
            )
),
                        child: Container(

                        padding: EdgeInsets.all(15),
                          child: Text("${result_string}",style:GoogleFonts.aBeeZee(fontSize: 20,color: Colors.black),),),

                      )));

                  },itemCount: snapshot.data.docs.length,);

               }
             return SizedBox();


             },),
         ),
        SizedBox(width: 20,),
          TextField(

            controller: question,

            decoration: InputDecoration(

              border: OutlineInputBorder(

              ),

              hintText: "ENTER THE MESSAGE",

              labelText: "MESSAGE",
              prefixIcon: IconButton(
                icon: Icon(Icons.mic),
                onPressed: (){print("HI");
                (_speechToText.isListening)?(
                    stopListening()
                ):(
                    startListening()
                );






                  },
              ),



              suffixIcon: IconButton(icon: Icon(Icons.send_outlined),onPressed: (){

                list.add(question.text);

                dialog=ProgressDialog(context,type: ProgressDialogType.normal);
                dialog.style(
                  message: "PLEASE WAIT",

                );
                dialog.show();

                setState(() {

                  ans=question.text;

                });



                 addans(ans);

              },),







            ),

          ),
        ],
      ),

    );
  }
addans(answer) async{


    await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).doc().set({
      "message":answer,
      "type":"human",
      "time":FieldValue.serverTimestamp()
      
    }).whenComplete(() {
      getanswer(answer);
      question.clear();

    });
}


delete() async
{

  await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.uid).get().then((value){

    for(DocumentSnapshot doc in value.docs)
      {
        doc.reference.delete();
      }

  });

}





}


