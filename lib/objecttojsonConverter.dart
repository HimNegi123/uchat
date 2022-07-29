class Converter{
  String fname;
 String lname;
 String email;
 String password;
 Converter(this.fname ,this.lname, this.email, this.password); 
 Map toJson()=>{
  "fname":fname,
  "lname":lname,
  "email":email,
  "password":password
 };
}
class LoginConverter{
  String email;
  String password;
  LoginConverter(this.email,this.password);
  Map toJson()=>{
    "email":email,
    "password":password
  };
}

class Profileget{
  String token;
  Profileget(this.token);
  Map toJson()=>{
    "token":token 
 };
}

