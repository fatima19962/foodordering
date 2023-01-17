
import 'package:foodordering/pages/auth/sign_in_page.dart';
import 'package:foodordering/pages/cart/cart_page.dart';
import 'package:foodordering/pages/food/populer_food_detail.dart';
import 'package:foodordering/pages/food/recommended_food_detail.dart';
import 'package:foodordering/pages/home/home_page.dart';
import 'package:foodordering/pages/home/main_food_page.dart';
import 'package:foodordering/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign_in';



  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  // static String getPopularFood(int pageId, String page) =>
      // '$popularFood?pageId=$pageId&page=$page';
  // static String getRecommendedFood(int pageId) =>
      // '$recommendedFood?pageId=$pageId';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    // GetPage(name: initial, page: () => HomePage()),
    GetPage(name: initial, page: () {  return HomePage();}),

    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fadeIn),
    // GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          // return RecommendedFoodDetail(
            // pageId: int.parse(pageId!),
          // );
          return RecommendedFoodDetail(pageId: int.parse(pageId!),page: page!);
        },
      transition: Transition.rightToLeftWithFade,
        ),
    // GetPage(
    //   name: recommendedFood,
    //   page: () =>RecommendedFoodDetail(),
    //
    //   transition: Transition.rightToLeft,
    // ),
    GetPage(
      name: popularFood,
      page: () {
        print("popularFood page ");
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopulerFoodDetail(pageId: int.parse(pageId!),page: page!);
        // return PopulerFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),

  ];
}
