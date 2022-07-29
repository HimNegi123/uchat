
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AuthenticationUi/AuthUi.dart';
import '../ScreenUi/HomeScreen.dart';
import '../preferences.dart';

class SplashSceen extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
 return SplashUI();
  }
}
class SplashUI extends State<SplashSceen>{
  @override
  void initState() {
    super.initState();
   aAuthChecking();
  }
  aAuthChecking()async{
  if(await outputSharedPreference()==true){
  await Future.delayed(const Duration(seconds: 3)); 
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  else{
     await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthUi()));
  }
  }
  @override
  Widget build(BuildContext context) {
    final HEIGHT=MediaQuery.of(context).size.height;
    final WIDTH=MediaQuery.of(context).size.width;
   return Scaffold(
  
    backgroundColor:const Color.fromARGB(255, 22, 22, 22),     //HEX: #161616ff
    body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
 Center(
  child: Image.asset('Resourse/SplashGif.gif',height: HEIGHT*0.21,width: WIDTH*0.4),),
  const Text("uCHAT",style: TextStyle(color: Color.fromARGB(255, 227, 219, 219),fontSize:20,fontWeight:FontWeight.bold)),
  SizedBox(height: HEIGHT*.1),
  const CircularProgressIndicator()
      ],
    ),
    
    );
  }

}