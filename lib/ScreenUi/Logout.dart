
import 'package:flutter/material.dart';

import '../AuthenticationUi/AuthUi.dart';
import '../preferences.dart';
void alertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        
        title:const Text("DO YOU WANT TO LOG OUT",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
     SizedBox(height:50,width:400,child:ElevatedButton(onPressed: ()async{
      await deleteSharedPreference();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthUi()));
       }, child:const Text('LOG OUT',style:TextStyle(fontWeight: FontWeight.bold)),
       style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 22, 22, 26),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)))) 
        ],
      );
    });}