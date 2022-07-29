import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uchat/ScreenUi/HomeScreen.dart';

import '../AuthenticationApis/ApiProcess.dart';
import '../objecttojsonConverter.dart';

  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}
class LoginScreen extends State<Login>{
  @override
  Widget build(BuildContext context) {
    final HEIGHT=MediaQuery.of(context).size.height;
    final WIDTH=MediaQuery.of(context).size.width;
   return Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Color.fromARGB(255, 22, 22, 22),
    body:Container(
    child:Center(
      child:Column(
        children: [
          SizedBox(height:HEIGHT*.2),
          Text("LogIn",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize:50)),
            SizedBox(height:HEIGHT*0.05),
  Container(
    
    height:HEIGHT*0.06,
    width: WIDTH*0.98,
    decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14),borderRadius:BorderRadius.circular(45),
    ),
    child: Row(children: [
      Padding(padding: EdgeInsets.all(5)),
      Icon(Icons.mail,color: Colors.white,size:40,),
      SizedBox(width: HEIGHT*0.01,),
      SizedBox(height:HEIGHT*0.3,width: WIDTH*0.8,
      child:TextField( 
        controller: email,
        decoration: InputDecoration(  
        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
    border: InputBorder.none,  
    hintText: 'Email',
  ), style: TextStyle(color: Colors.white,fontSize: 20), cursorColor:Colors.white,),),
  
    ],
    
    ),
  ),
    SizedBox(height:HEIGHT*0.05),
  Container(
    height:HEIGHT*0.06,
    width: WIDTH*0.98,
    decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14),borderRadius:BorderRadius.circular(45),
    ),
    child: Row(children: [
      Padding(padding: EdgeInsets.all(5)),
      Icon(Icons.password,color: Colors.white,size:40,),
      SizedBox(width: HEIGHT*0.01,),
      SizedBox(height:HEIGHT*0.3,width: WIDTH*0.8,child:TextField(
        controller: password,
        obscureText: true,
enableSuggestions: false,
autocorrect: false, decoration: InputDecoration(  
        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
    border: InputBorder.none,  
    hintText: 'Password',
  ), style: TextStyle(color: Colors.white,fontSize: 20), cursorColor:Colors.white,),),
  
  
    ],
    
    ),
  ),
   SizedBox(height: HEIGHT*0.1,),
   Container(
    height:HEIGHT*.09,width: WIDTH*.4,
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),),
    child:ElevatedButton(onPressed: () async {
if(email.text==''||password.text==''){
  Fluttertoast.showToast(msg: 'invalid fields');
}
 else if (!email.text.toLowerCase().contains('@gmail.com')) {
    Fluttertoast.showToast(msg: 'Gmail Id is not valid');
  }
  else{
  var obj= ApiProcess();  
    LoginConverter body=LoginConverter(email.text, password.text);
   bool check= await obj.LoginInPost(jsonEncode(body));
   bool ans= ApiCheck(check);
   print(ans);
   if(ans==false){
Fluttertoast.showToast(msg: "EMAIL ID AND PASSWORD IS NOT VALID");
   }
   else{
    showDialog(
barrierDismissible: false,
context: context,builder: (_) {
return Dialog(
backgroundColor: Colors.white,
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 20),
child: Column(
mainAxisSize: MainAxisSize.min,
children: const [ CircularProgressIndicator(),
SizedBox(  height: 15),
Text('Loading...')],),),); });
email.clear();
password.clear();
    await Future.delayed(const Duration(seconds:1)); 
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));  
   }
  }
   }, 
  child:  Text("Lets Go",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30)),
  style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 45, 53, 200),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),)),
        ],
      ) 
    )
    ),   
   );
  }
}
 bool ApiCheck(value){
if(value==false){
  return false;
}
else{
  return true;
}
  }