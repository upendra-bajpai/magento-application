 
 import 'package:http/http.dart';
import 'package:magento_mobile/models/login_modal.dart';
import 'package:magento_mobile/models/sign_up_response.dart';
import 'package:magento_mobile/network/api_base_helper.dart';
import 'package:magento_mobile/network/end_point.dart';

 class SignUpRepo{
 ApiBaseHelper _apiClinet=ApiBaseHelper();
  Future<SignUpResponse> putLogin(String json) async{
    final response=await _apiClinet.post(club(SIGNUP_END), json);
    return SignUpResponse.fromJson(response);
  }
 }