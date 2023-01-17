import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodordering/routes/route_helper.dart';
import 'package:foodordering/utils/Dimensions.dart';

import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  /*
    AnyClass(){
       newObject(){
           return . .
       }
    }

    var x = AnyClass()..newObject()
    x = x.newObject()
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    Timer(
      Duration(seconds: 4),
      () => Get.offNamed(
        RouteHelper.getInitial(),
      ),
    );
    _loadResource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/images/logo part 1.png',
                // width: Dimensions.size25 * 4,
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logo part 2.png',
              // width: Dimensions.size25 * 4,
              width: Dimensions.splashImg,
            ),
          ),
        ],
      ),
    );
  }
}
