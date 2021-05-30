import 'dart:async';
import 'dart:convert';

import 'package:magento_mobile/models/login_modal.dart';
import 'package:magento_mobile/repository/login_repo.dart';
import 'package:magento_mobile/utils.dart';


class LoginBloc {
 Future<LoginModal> doPostLogin(String uid,String pwd){
     var _resBody = {};
    _resBody["username"] = "testtest115@gmail.com";
    _resBody["password"] = "test123.";
     String _loginData = json.encode(_resBody);
     logd(_loginData);
    LoginRepo _loginRepo=LoginRepo();
    return _loginRepo.putLogin(_loginData).then((value) => value);
  }
}
