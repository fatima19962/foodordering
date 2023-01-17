import 'package:foodordering/data/api/api_client.dart';
import 'package:foodordering/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo{
  final ApiClient apiClient;

  UserRepo( {required this.apiClient});

  Future<Response>getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}