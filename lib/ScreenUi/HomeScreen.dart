
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Appstate.dart';
import '../AuthenticationApis/ApiProcess.dart';
import 'ChattingPage.dart';
import 'Dashboard.dart';
import 'Logout.dart';
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return HomeUI();
  }
}
class HomeUI extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    var pages=[ChattingPage(),Dashboard()];
    Appstate provider=Provider.of<Appstate>(context);
    return Scaffold(
      resizeToAvoidBottomInset:false,
  backgroundColor: Color.fromARGB(255, 22, 22, 22),
      body: pages[provider.setPage],      
      bottomNavigationBar:BottomNavigationBar(items: <BottomNavigationBarItem> [
       const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Dashboard'),
      BottomNavigationBarItem(icon: IconButton(onPressed:(){
       alertDialog(context);
      }, icon:const  Icon(Icons.logout)),label:'Logout' )
      ],currentIndex: provider.setPage,
      onTap:(value) {
        provider.updatePage(value);
      },

      ),
      
    );
  }

}