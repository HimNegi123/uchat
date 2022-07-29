
import 'package:flutter/cupertino.dart';

import 'AuthenticationApis/ApiProcess.dart';
import 'AuthenticationApis/Model.dart';

class Appstate extends ChangeNotifier{
bool isvisible=false;
updateVisible(){
  isvisible=true;
  notifyListeners();
}
int setPage=0;
updatePage(var pageno){
  setPage=pageno;
  notifyListeners();
}
bool isAuth=false;
 AuthChecker(var value){
  isAuth=value;
  notifyListeners();
 }
 Model? data;
 var obj=ApiProcess();
UpdataApiDashBoard()async {
 data=await obj.getProfileImage();
 print('value of data is ${data!.lname}');
 notifyListeners();
}

}