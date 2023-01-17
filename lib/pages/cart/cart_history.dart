import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodordering/base/no_data_page.dart';
import 'package:foodordering/controllers/cart_controller.dart';
import 'package:foodordering/pages/cart/cart_model.dart';
import 'package:foodordering/routes/route_helper.dart';
import 'package:foodordering/utils/Dimensions.dart';
import 'package:foodordering/utils/colors.dart';
import 'package:foodordering/utils/constants.dart';
import 'package:foodordering/widgets/app_icon.dart';
import 'package:foodordering/widgets/big_text.dart';
import 'package:foodordering/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, int> cartItemsPerOrder = {};
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time.toString(), (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(
            getCartHistoryList[i].time.toString(), () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;
    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parsedDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputDate);
      }
      return BigText(text:outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height10*10,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding:  EdgeInsets.only(top:Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: 'Cart History',
                  color: Colors.white,
                ),
                GestureDetector
                  (
                    onTap:(){
                      Get.toNamed(RouteHelper.getCartPage());
                    },

                    child: AppIcon(icon: Icons.shopping_cart,iconColor: AppColors.mainColor,backgroundColor: AppColors.yellowColor,)
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getCartHistoryList().isNotEmpty
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.all(Dimensions.size20),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOrder.length; i++)

                              Container(
                                //height: 130,
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                  children: [
                                    timeWidget(listCounter),
                                    // BigText(
                                    // text: getCartHistoryList[listCounter].time!),
                                    // ((){
                                    //
                                    //     DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss')
                                    //         .parse(getCartHistoryList[listCounter].time!);
                                    //     var inputDate = DateTime.parse(parsedDate.toString());
                                    //     var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
                                    //     var outputDate = outputFormat.format(inputDate);
                                    //
                                    //   return BigText(text:outputDate);
                                    // }()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                              itemsPerOrder[i], (index) {
                                            if (listCounter <
                                                getCartHistoryList.length) {
                                              listCounter++;
                                            }
                                            return index < 2
                                                ? Container(
                                                    margin:
                                                        EdgeInsets.only(
                                                      top: Dimensions.height10,
                                                      right:Dimensions.height10/2 ,
                                                      bottom: Dimensions.height10,
                                                    ),
                                                    height: Dimensions.height20*4,
                                                    width: Dimensions.height20*4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          AppConstants.baseUrl +
                                                              AppConstants
                                                                  .uploadUrl +
                                                              getCartHistoryList[
                                                                      listCounter -
                                                                          1]
                                                                  .img!,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }),
                                        ),
                                        SizedBox(
                                          height: Dimensions.height20*4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SmallText(
                                                text: 'Total:',
                                              ),
                                              BigText(
                                                text: '${itemsPerOrder[i]} items',

                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  var orderTime =
                                                      cartOrderTimeToList();
                                                  Map<int, CartModel>
                                                      moreOrder = {};
                                                  for (int j = 0;
                                                      j <
                                                          getCartHistoryList
                                                              .length;
                                                      j++) {
                                                    if (getCartHistoryList[j]
                                                            .time ==
                                                        orderTime[i]) {
                                                      moreOrder.putIfAbsent(
                                                        getCartHistoryList[j]
                                                            .id!,
                                                        () =>
                                                            CartModel.fromJson(
                                                          jsonDecode(
                                                            jsonEncode(
                                                                getCartHistoryList[
                                                                    j]),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                  Get.find<CartController>()
                                                      .setItems = moreOrder;
                                                  Get.find<CartController>()
                                                      .addToCartList();
                                                  Get.toNamed(RouteHelper
                                                      .getCartPage());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                    border: Border.all(
                                                      width: 1,
                                                      color:
                                                          AppColors.mainColor,
                                                    ),
                                                  ),
                                                  child: SmallText(
                                                    text: 'One more',
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(
                      child: NoDataPage(
                        text: 'You did not buy anything',
                        imgPath: 'assets/images/empty_box.png',
                      ),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
