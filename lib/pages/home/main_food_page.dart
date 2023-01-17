import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/controllers/popular_product_controller.dart';
import 'package:foodordering/controllers/recommended_product_controller.dart';
import 'package:foodordering/pages/home/food_page_body.dart';

import 'package:foodordering/utils/Dimensions.dart';
import 'package:foodordering/utils/colors.dart';
import 'package:foodordering/widgets/big_text.dart';
import 'package:foodordering/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);


  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}
Future<void> _loadResource() async {
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
}
class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print("current height is " + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(child: Column(
      children: [
        // showing the header
        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Country", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "city", color: Colors.black54),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.IconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // showing the body
        Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            )),
      ],
    ), onRefresh:_loadResource );

  }
}
