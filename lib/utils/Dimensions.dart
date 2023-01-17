import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 844/220 = 3.84;
  // 692/220=height we give yourself  = 3.15
  // 692/320 page view
  static double pageView = screenHeight / 2.16;
  static double pageViewContainer = screenHeight / 3.15;
  static double pageViewTextContainer = screenHeight / 5.76;
  // dynamic height
  // 692/120 = text
  static double height10 = screenHeight / 69.2;
  // 692/10=69.2
  static double height15 = screenHeight / 46.13;
  static double height20 = screenHeight / 34.6;
  static double height30 = screenHeight / 23.06;
  static double height45 = screenHeight / 15.38;

  // dynamic width padding and margin

  static double width10 = screenHeight / 69.2;
  static double width15 = screenHeight / 46.13;
  static double width20 = screenHeight / 34.6;
  static double width30 = screenHeight / 23.06;
  static double width45 = screenHeight / 15.38;

  // fontsize
  static double font16 = screenHeight / 43.25;

  static double font20 = screenHeight / 34.6;
  static double font26 = screenHeight / 26.62;
// default icon in flutter is 20
  static double IconSize24 = screenHeight / 28.83;
  static double IconSize16 = screenHeight / 43.25;
  // radius
  static double radius15 = screenHeight / 46.13;
  static double radius20 = screenHeight / 34.6;
  static double radius30 = screenHeight / 23.06;
  // list view size
  // 3.25
  // 692/120
  static double listViewImgSize = screenWidth / 5.77;
  // 692/100
  static double listViewTextContSize = screenWidth / 3.92;

  // POPULER food
  // 692/350
  static double populerFoodImgSize = screenHeight / 1.98;

// 692/120 but i use 692/100
  static double bottomHeightBar = screenHeight / 7.03;

  //splash
  static double splashImg = screenHeight / 3.38;





  // size
  static double size100 = screenHeight / 6.83;
  static double size5 = screenHeight / 136.6;
  static double size10 = screenHeight / 68;
  static double size15 = screenHeight / 45;
  static double size20 = screenHeight / 34.15;
//683/210=3.25
  static double size300 = screenHeight / 2.28;
  static double size285 = screenHeight / (screenHeight / 285);
  static double size210 = screenHeight / 3.25;
  static double size260 = screenHeight / 2.63;
  static double size120 = screenHeight / 5.69;
  static double size110 = screenHeight / (screenHeight / 110);
  static double size25 = screenHeight / (screenHeight / 25);
  static double size30 = screenHeight / 22.77;
  static double size45 = screenHeight / 15.18;
}
