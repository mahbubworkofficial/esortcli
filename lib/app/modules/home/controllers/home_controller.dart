
import 'package:get/get.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController

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
  var selectedIndex = 0.obs; // Tracks the selected radio button index
  var scrollIndex = 0.obs; // Tracks the visible container for scroll indicator
  var maxScrollExtent = 0.0.obs; // Tracks the total scrollable height

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
//
// class ScrollLinePainter extends CustomPainter {
//   final int activeIndex;
//   final int totalSegments;
//
//   ScrollLinePainter({required this.activeIndex, required this.totalSegments});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;
//
//     final segmentHeight = size.height / totalSegments;
//
//     for (int i = 0; i < totalSegments; i++) {
//       paint.color = i == activeIndex ? AppColor.defaultColor : Colors.grey;
//       final startY = i * segmentHeight;
//       final endY = (i + 1) * segmentHeight;
//       canvas.drawLine(
//         Offset(size.width / 2, startY),
//         Offset(size.width / 2, endY),
//         paint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }