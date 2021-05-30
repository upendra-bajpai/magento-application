import 'dart:async';
import 'dart:convert';


import 'package:magento_mobile/models/sign_up_response.dart';
import 'package:magento_mobile/repository/signup_repository.dart';
import 'package:magento_mobile/utils.dart';

class SignUpBloc{
   Future<SignUpResponse> doPostSignUp(){
     var _resBody = '{ "customer": { "email": "testtest119@gmail.com", "firstname": "kutta", "lastname": "Peter", "addresses": [{ "defaultShipping": true, "defaultBilling": true, "firstname": "Kavin", "lastname": "Peter", "region": { "regionCode": "NY", "region": "New York", "regionId":43 }, "postcode": "10755", "street": ["123 Oak Ave"], "city": "Purchase", "telephone": "1234567890", "countryId": "US" }], "extension_attributes": { "is_subscribed": true }, "custom_attributes": [ { "attribute_code": "customer_mobile", "value": "1234567890" } ] }, "password": "test123." }';
     String _loginData = json.encode(_resBody);
     logd(_loginData.toString());
    SignUpRepo _loginRepo=SignUpRepo();
    return _loginRepo.putLogin(_resBody).then((value) => value);
  }
}