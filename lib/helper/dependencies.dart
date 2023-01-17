import 'package:foodordering/controllers/auth_controller.dart';
import 'package:foodordering/controllers/cart_controller.dart';
import 'package:foodordering/controllers/popular_product_controller.dart';
import 'package:foodordering/controllers/recommended_product_controller.dart';
import 'package:foodordering/controllers/user_controller.dart';
// import 'package:foodordering/controllers/recipe.api.dart';
import 'package:foodordering/data/api/api_client.dart';
import 'package:foodordering/data/repository/auth_repo.dart';
import 'package:foodordering/data/repository/cart_repo.dart';
import 'package:foodordering/data/repository/popular_product_repo.dart';
import 'package:foodordering/data/repository/recommended_product_repo.dart';
import 'package:foodordering/data/repository/user_repo.dart';
import 'package:foodordering/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl,sharedPreferences:Get.find()));
  Get.lazyPut(() =>AuthRepo(apiClient: Get.find(), sharedPreferences:Get.find()));
  Get.lazyPut(() =>UserRepo(apiClient: Get.find()));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //  Get.lazyPut(() => RecipeApi(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  // Get.lazyPut(() => CartRepo());
  //controllers
  Get.lazyPut(() =>UserController(userRepo: Get.find()));
  Get.lazyPut(() =>AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
