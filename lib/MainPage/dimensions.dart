import 'package:get/get.dart';

class dimensions{



  static double? screenHeight = Get.context?.height;
  static double? screenWidth = Get.context?.width;

  static var pageView = screenHeight! / 2.64;
  static var pageViewContainer = screenHeight! / 3.84;
  static var pageViewTextContainer = screenHeight! / 7.03;

  static var height10 = screenHeight! /84.4;
  static var height15 = screenHeight! /56.27;
  static var height20 = screenHeight! /42.2;
  static var height30 = screenHeight! /28.13;
  static var height40 = screenHeight! /18.76;

  static double width10 = screenWidth! /84.4;
  static double width15 = screenWidth! /56.27;
  static double width20 = screenWidth! /42.2;
  static double width30 = screenWidth! /28.13;

  static double font20 = screenHeight! /42.2;

  //radius
  static double radius15 = screenHeight! /56.27;
  static double radius20 = screenHeight! /42.2;
  static double radius30 = screenHeight! /28.13;

  //icons size
static double iconeSize24 = screenHeight! /35.17;

}