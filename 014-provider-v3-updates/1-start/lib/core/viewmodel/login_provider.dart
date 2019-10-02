

import 'package:flutter/cupertino.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodel/base_model.dart';

class LoginModel extends BaseModel{
  AuthenticationService _authenticationService;

  LoginModel({@required AuthenticationService authenticationService, }):_authenticationService=authenticationService;

  Future<bool> login (String userIdText)async{
      setBusy(true);
      var userId=int.tryParse(userIdText);
      var success=await _authenticationService.login(userId);
      setBusy(false);
      return success;
  }
}