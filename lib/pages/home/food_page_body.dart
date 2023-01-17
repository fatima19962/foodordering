import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/controllers/popular_product_controller.dart';
import 'package:foodordering/controllers/recommended_product_controller.dart';
import 'package:foodordering/data/repository/popular_product_repo.dart';
import 'package:foodordering/models/products_model.dart';
import 'package:foodordering/pages/food/populer_food_detail.dart';
import 'package:foodordering/routes/route_helper.dart';
import 'package:foodordering/utils/Dimensions.dart';
import 'package:foodordering/utils/colors.dart';
import 'package:foodordering/utils/constants.dart';
import 'package:foodordering/widgets/app_column.dart';
import 'package:foodordering/widgets/big_text.dart';
import 'package:foodordering/widgets/icon_and_text_widget.dart';
import 'package:foodordering/widgets/small_text.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("current value is" + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // slider section
            GetBuilder<PopularProductController>(builder: (popularProducts) {

                return popularProducts.isLoaded? Container(
                      color: Colors.white,
                      height: Dimensions.pageView,

                        child: PageView.builder(
                            controller: pageController,
                            itemCount: popularProducts.popularProductList.length,
                            itemBuilder: (context, position) {
                              return _buildPageItem(position,
                                  popularProducts.popularProductList[position]);
                            }),

                ):CircularProgressIndicator(color: AppColors.mainColor);



            }),
            // Dots
            GetBuilder<PopularProductController>(builder: (popularProducts) {
              return DotsIndicator(
                dotsCount: popularProducts.popularProductList.isEmpty
                    ? 1
                    : popularProducts.popularProductList.length,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: AppColors.mainColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            }),
            // populer text
            SizedBox(
              height: Dimensions.size30,
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.size30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigText(text: "Recommeneded"),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(
                      text: ".",
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: SmallText(
                      text: "Food pairing",
                    ),
                  ),
                ],
              ),
            ),
            //  recommendedProduct
            //  list of food and images

            GetBuilder<RecommendedProductController>(builder: (recommendedProduct){

                return  recommendedProduct.isLoaded?  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:(){
                        Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            // image section
                            Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                      NetworkImage(
                                          AppConstants.baseUrl + AppConstants.uploadUrl + recommendedProduct.recommendedProductList[index].img!),)),
                            ),
                            // text container
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextContSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                      Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                      Radius.circular(Dimensions.radius20)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                            text: recommendedProduct.recommendedProductList[index].name!),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        SmallText(
                                            text: recommendedProduct.recommendedProductList[index].description!),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndTextWidget(
                                                icon: Icons.circle_sharp,
                                                text: "Normal",
                                                iconColor: AppColors.iconColor1),
                                            IconAndTextWidget(
                                                icon: Icons.location_on,
                                                text: "1.7km",
                                                iconColor: AppColors.mainColor),
                                            IconAndTextWidget(
                                                icon: Icons.access_time_rounded,
                                                text: "32min",
                                                iconColor: AppColors.iconColor2),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })

                :CircularProgressIndicator(
                color:AppColors.mainColor,
              );

            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      // 1/10*220=22 pixel
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      // 1/10*220=22 pixel
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 * _scaleFactor), 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopularFood(index,'home'));
        },

                child: Container(
                  height: Dimensions.pageViewContainer,
                  // height: 190,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.baseUrl + AppConstants.uploadUrl + popularProduct.img!),
                    ),
                  ),
                ),
    ),


              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Dimensions.pageViewTextContainer,
                  //  height: 100,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                        BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                    child: AppColumn(
                      text: popularProduct.name!,
                    ),
                  ),
                ),
              ),


        ],
      ),
    );
  }
}
