import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

inputSharedPreference(String token) async{
  final pref=await SharedPreferences.getInstance();
  pref.setString('token', token);
}
Future<bool> outputSharedPreference() async{
final pref=await SharedPreferences.getInstance();
if(pref.getString('token')!=null){
  return true;
} 
else{
  return false;
}
}
deleteSharedPreference() async{
final pref=await SharedPreferences.getInstance();
pref.remove('token');
}