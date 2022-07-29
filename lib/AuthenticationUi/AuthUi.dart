import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uchat/AuthenticationUi/login.dart';
import 'package:uchat/ScreenUi/HomeScreen.dart';
import 'package:uchat/objecttojsonConverter.dart';

import '../Appstate.dart';
import '../AuthenticationApis/ApiProcess.dart';
final TextEditingController fname=TextEditingController();
  final TextEditingController lname=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
class AuthUi extends StatefulWidget{
@override
State<StatefulWidget> createState() {
return AuthMainUI(); } }
class AuthMainUI extends State<AuthUi>{
  @override
  Widget build(BuildContext context) {
  
  final HEIGHT=MediaQuery.of(context).size.height;
  final WIDTH=MediaQuery.of(context).size.width;
  return Scaffold( 
  resizeToAvoidBottomInset: false,
  backgroundColor: Color.fromARGB(255, 22, 22, 22),
  body:Center(child: 
   Column(
  children: [
  SizedBox(height:HEIGHT*.1,),
  const Center(child: Text('Hey there,',style: TextStyle(color: Color.fromARGB(255, 229, 223, 223),fontSize:30)),),
  SizedBox(height:HEIGHT*.03,),
  const Center(child: Text('Create an Account',style: TextStyle(color: Color.fromARGB(255, 229, 223, 223),fontSize:30,fontWeight: FontWeight.bold))),
  SizedBox(height:HEIGHT*0.05),
  Container(
  height:HEIGHT*0.06,
  width: WIDTH*0.98,
  decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14),borderRadius:BorderRadius.circular(45),),
  child: Row(children: [
  const Padding(padding: EdgeInsets.all(5)),
  const Icon(Icons.account_circle_outlined,color: Colors.white,size:40,),
  SizedBox(width: HEIGHT*0.01,),
  SizedBox(height:HEIGHT*0.3,width: WIDTH*0.8,child:TextField( 
  controller: fname
  ,decoration: InputDecoration(
  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
  border: InputBorder.none,  
    hintText: 'First Name',), 
    style: TextStyle(color: Colors.white,fontSize: 20), cursorColor:Colors.white,),), ],),),
   SizedBox(height:HEIGHT*0.02),
  Container(
  height:HEIGHT*0.06,
  width: WIDTH*0.98,
  decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14),borderRadius:BorderRadius.circular(45),),
  child: Row(children: [
  Padding(padding: EdgeInsets.all(5)),
  Icon(Icons.account_circle_outlined,color: Colors.white,size:40,),
  SizedBox(width: HEIGHT*0.01,),
  SizedBox(height:HEIGHT*0.3,width: WIDTH*0.8,child:TextField(
  controller: lname,decoration: InputDecoration(  
  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
  border: InputBorder.none,  
  hintText: 'Last Name',), style: const TextStyle(color: Colors.white,fontSize: 20), cursorColor:Colors.white,),),],),),
  SizedBox(height:HEIGHT*0.02),
  Container(
  height:HEIGHT*0.06,
  width: WIDTH*0.98,
  decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14),borderRadius:BorderRadius.circular(45),),
    child: Row(children: [
   const Padding(padding: EdgeInsets.all(5)),
  const Icon(Icons.mail,color: Colors.white,size:40,),
  SizedBox(width: HEIGHT*0.01,),
  SizedBox(height:HEIGHT*0.3,width: WIDTH*0.8,child:TextField( 
    controller: email,
  decoration: const InputDecoration(  
   hintStyle:  TextStyle(fontSize: 20.0, color: Colors.white),
  border: InputBorder.none,  
  hintText: 'Email Id',), style: const TextStyle(color: Colors.white,fontSize: 20), cursorColor:Colors.white,),),  ],   ),),
  SizedBox(height:HEIGHT*0.02),
  Container(
    height:HEIGHT*0.06,
    width: WIDTH*0.98,
    decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14),borderRadius:BorderRadius.circular(45),),
    child: Row(children: [
    Padding(padding: EdgeInsets.all(5)),
    const Icon(Icons.password,color: Colors.white,size:40,),
    SizedBox(width: HEIGHT*0.01,),
    SizedBox(height:HEIGHT*0.3,width: WIDTH*0.8,child:TextField(
   controller:password,
  obscureText: true,
enableSuggestions: false,
autocorrect: false,
 decoration: InputDecoration(  
hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
border: InputBorder.none,  
hintText: 'Password',
), style: TextStyle(color: Colors.white,fontSize: 20), cursorColor:Colors.white,),),],  ),),
SizedBox(height: HEIGHT*0.1,),
Container(
height:HEIGHT*.09,width: WIDTH*.4,
decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),),
child:Consumer<Appstate>(builder: ((context, value, child) {
return   ElevatedButton(onPressed:() async {
  if(fname.text==''||lname.text==''||password.text==''||email.text==''){    
    Fluttertoast.showToast(msg: 'Invalid Field');
  }
   else if (!email.text.toLowerCase().contains('@gmail.com')) {
    Fluttertoast.showToast(msg: 'Gmail Id is not valid');
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
await Future.delayed(const Duration(seconds: 3));          
var obj= ApiProcess();    
 Converter data= Converter(fname.text,lname.text,email.text,password.text);
 obj.SignInPost(jsonEncode(data)) ;
fname.clear();
lname.clear();
email.clear();
password.clear();
Navigator.pushReplacement(context,MaterialPageRoute(builder: ((context) => HomeScreen())));
  }},
 child:  Text("Lets Go",style:TextStyle(fontWeight: FontWeight.bold,fontSize:30)),
 style: ElevatedButton.styleFrom(primary:const Color.fromARGB(255, 45, 53, 200),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),); }),)),
SizedBox(height:HEIGHT*0.1, child:Container(padding: EdgeInsets.all(HEIGHT*0.028),child:Consumer<Appstate>(builder: ((context, value, child) {
return Visibility(child: CircularProgressIndicator(),visible:value.isvisible);}))),),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
const Text("Already have an account?",style:TextStyle(fontSize:15,color: Colors.white)),
TextButton(onPressed: (){
fname.clear();
lname.clear();
email.clear();
password.clear();
Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
}, child: const Text("Login",style: TextStyle(color: Colors.amber),))],)]) ) );}}