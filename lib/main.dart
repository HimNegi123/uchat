
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Appstate.dart';
import 'splashScreen/SplashSceen.dart';
 void main(List<String> args) {
  return runApp(
    ChangeNotifierProvider(create: (context)=>Appstate(),
    child: MaterialApp(home:Connector(),debugShowCheckedModeBanner: false))
    );
}
class Connector extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainUi();
  }
}
class MainUi extends State<Connector>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body:SplashSceen()
   );
  }
  
}