import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../objecttojsonConverter.dart';
import '../preferences.dart';
import 'Model.dart';
class ApiProcess{
Future<String> SignInPost(String Bodydata) async{
var response =await http.post(Uri.parse('https://authbackend12.herokuapp.com/signin'),
headers: <String,String>{
  'Content-Type': 'application/json; charset=UTF-8',
}
,body:Bodydata);
if(response.statusCode==200){
  print(response.body);
  await inputSharedPreference(response.body.toString());
return response.body.toString();
}
else{
  throw e;
}
}
Future<bool> LoginInPost(String loginBody)async{
var response =await http.post(Uri.parse('https://authbackend12.herokuapp.com/login'),
headers: <String,String>{
  'Content-Type': 'application/json; charset=UTF-8',
},
body:loginBody
);
if(response.statusCode==200){
     String token=response.body.toString();
     print('token is:'+ token);
     if(token=='none'){
      print(false);
      return false;
     }
     else{
    await inputSharedPreference(token);
return true;
     }

}
else{
  throw e;
}
}
UpdataProfile(image)async{
var request = http.MultipartRequest('POST', Uri.parse('https://authbackend12.herokuapp.com/profile'));
final pref=await SharedPreferences.getInstance();
request.headers.addAll({"authorization": pref.getString('token').toString()});
request.files.add(await http.MultipartFile.fromPath('image', image.path));
var response =await request.send();
print(response.statusCode);
var responsed= await http.Response.fromStream(response);
final responseData=json.decode(responsed.body);
}
Future<Model> getProfileImage()async{

final pref=await SharedPreferences.getInstance();
var vale=pref.getString('token').toString();
var data=Profileget(vale);
var Datapass=jsonEncode(data);
print(Datapass);
var response=await http.post(Uri.parse('https://authbackend12.herokuapp.com/'),
headers: <String,String>{
  'Content-Type': 'application/json; charset=UTF-8',
},
body:Datapass
);
print(response.body);
return Model.fromJson(jsonDecode(response.body));
}
}