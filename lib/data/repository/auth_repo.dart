import 'package:foodordering/data/api/api_client.dart';
import 'package:foodordering/models/signup_body_model.dart';
import 'package:foodordering/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,

});
  Future<Response>registration(SignupBody signupBody) async {
     return await apiClient.postData(AppConstants.REGISTRATION_URI, signupBody.toJson());
  }
  bool userLoggedIn() {
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }
  Future<String> getUserToken() async {
    return  sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }
  Future<Response>login(String email,String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URI,
        {"email":email,"password":password});
  }

  // UpdateTokan(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('TOKEN', token);
  // }
  Future<bool> saveUserToken(String token) async {
    apiClient.token=token;
    apiClient.updateHeader(token);
    return  await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void>saveUserNumberAndPassword(String number,String password ,String email) async {
    try{
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.EMAIL, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }

  bool clearSharedData(){
        sharedPreferences.remove(AppConstants.TOKEN);
        sharedPreferences.remove(AppConstants.PASSWORD);
        sharedPreferences.remove(AppConstants.PHONE);
        sharedPreferences.remove(AppConstants.EMAIL);
        apiClient.token='';
        apiClient.updateHeader('');
       return true;
  }

  // Future _Getchallenge() async {
  //   String? token;
  //   final prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token');
  //   try {
  //     final response = await Dio()
  //         .get(BASE_API + "challenge/getChallengeByUserAndType/calories",
  //         options: Options(headers: {
  //           'Authorization':
  //           'Bearer $token', //HEAD
  //           // "Authorization": loginUserData["token"],
  //         }));
  //
  //     // prefs.setString('token', response.data["token"].toString());
  //
  //     Map<String, dynamic> responseJson = await json.decode(response.toString());
  //     ch = responseJson['data'].reversed.toList();
  //     print(ch);
  //
  //     print("length:" + ch.length.toString());
  //   } catch (e) {
  //     print(e);
  //   }
  // }










}