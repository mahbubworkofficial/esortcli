
import 'package:get/get.dart';


class HomeController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
class FoodItemListController extends GetxController {
  var selectedIndex = 0.obs;
  var scrollIndex = 0.obs;
  var maxScrollExtent = 0.0.obs;

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  void updateScrollIndex(int index) {
    scrollIndex.value = index;
  }

  void updateMaxScrollExtent(double extent) {
    maxScrollExtent.value = extent;
  }
}