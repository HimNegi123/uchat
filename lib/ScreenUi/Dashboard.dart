import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uchat/Appstate.dart';

import '../AuthenticationApis/ApiProcess.dart';
import '../AuthenticationApis/Model.dart';
var obj=ApiProcess();
XFile? selectImage;
class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return DashUi();
  }
}
class DashUi extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<Appstate>(context);
     final HEIGHT=MediaQuery.of(context).size.height;
  final WIDTH=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body:FutureBuilder<Model>(future: obj.getProfileImage(),builder: ((context, snapshot) {
        if(snapshot.hasData){
  return   Center(child:Column(children: [
        SizedBox(height: HEIGHT*.1,),
       ClipOval(child: Image.network('${snapshot.data!.image}',fit: BoxFit.cover,height:200,width: 200,)),
      IconButton(onPressed: (){
  showModalBottomSheet(
  context: context,
  builder: (context) {
  return Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[          
          ListTile(
            leading: new Icon(Icons.photo),
            title: new Text('Gallery'),
            onTap: () async {
              final image =await ImagePicker().pickImage(source: ImageSource.gallery);
              if(image!=null){             
        obj.UpdataProfile(image);
        obj.getProfileImage();
      
              }            
              Navigator.pop(context);
              setState(() {               
              });
            },
          ),
          ListTile(
            leading: new Icon(Icons.camera),
            title: new Text('Camera'),
            onTap: () async{
             final photo=await ImagePicker().pickImage(source: ImageSource.camera);
             if(photo!=null){   
              
              setState(() {
                obj.UpdataProfile(File(photo.path));
             
              }); 
              Navigator.pop(context); 
             }
            },
          ),
        ],
      );
    });
      }, icon:const Icon(Icons.camera_alt_sharp,color: Colors.white,)),
       const   Text('Change Image',style: TextStyle(color:Colors.white),),
         SizedBox(height: HEIGHT*.05,),
          Text('${snapshot.data!.fname} ${snapshot.data!.lname}',style: TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.bold)),
           SizedBox(height: HEIGHT*.05,),
         Text('${snapshot.data!.email}',style: const TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold)),
         Image.asset('Resourse/dashboard.gif',height: HEIGHT*.12)
      ],) );
        }
else{
  return Container(child: CircularProgressIndicator());
}

      }),));

      }
    }
