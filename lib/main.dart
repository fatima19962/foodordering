import 'package:flutter/material.dart';
import 'package:foodordering/controllers/cart_controller.dart';
import 'package:foodordering/controllers/popular_product_controller.dart';
import 'package:foodordering/controllers/recommended_product_controller.dart';
import 'package:foodordering/data/repository/popular_product_repo.dart';
import 'package:foodordering/pages/auth/sign_in_page.dart';
import 'package:foodordering/pages/food/recommended_food_detail.dart';
import 'package:foodordering/pages/home/food_page_body.dart';
import 'package:foodordering/pages/home/main_food_page.dart';
import 'package:foodordering/routes/route_helper.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dp;
import 'pages/cart/cart_page.dart';
import 'pages/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dp.init();
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCardData();
    // Get.find<PopularProductController>().getPopularProductList();
    // Get.find<RecommendedProductController>().getRecommendedProductList();

   return GetBuilder<PopularProductController>(builder: (_){
          return GetBuilder<RecommendedProductController>(builder:(_){
            return  GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.teal,
              ),
              // home:SplashScreen(),
              // home:CartPage(),
              // home:MainFoodPage(),
              // home:SignInPage(),
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            );
          });
        });

  }
}
