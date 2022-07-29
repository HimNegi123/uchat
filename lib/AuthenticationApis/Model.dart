import 'package:flutter/material.dart';

class Model{
final String fname;
final String lname;
final String email;
final String password;
final String image;
const Model({required this.fname,required this.lname,required this.email,required this.password,required this.image});
factory Model.fromJson(Map<String,dynamic> json){
  return Model(fname:json['fname'] , lname: json['lname'], email:json['email'], password:json['password'],image:json['image']);
}
}