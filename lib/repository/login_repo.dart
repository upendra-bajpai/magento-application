
import 'package:http/http.dart';
import 'package:magento_mobile/models/login_modal.dart';
import 'package:magento_mobile/network/api_base_helper.dart';
import 'package:magento_mobile/network/end_point.dart';

class LoginRepo{
  ApiBaseHelper _apiClinet=ApiBaseHelper();
  Future<LoginModal> putLogin(String json) async{
    final response=await _apiClinet.post(club(LOGIN_END), json);
    if(response is Response){
      //LoginModal dss=LoginModal.fromJson(response.body as dynamic);
      return LoginModal.my(401,"We think you forgot your id or password.");
    }else{
      return LoginModal.my(200, response);
    }
     
  }
}