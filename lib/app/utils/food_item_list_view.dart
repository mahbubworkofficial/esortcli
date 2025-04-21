import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/delete_dialog.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../res/colors/app_color.dart';

class FoodItemListController extends GetxController {
  var selectedIndex = 0.obs; // Tracks the selected radio button index
  var scrollIndex = 0.obs; // Tracks the visible container for scroll indicator
  var maxScrollExtent = 0.0.obs; // Tracks the total scrollable height
  var itemHeight = 120.0.obs; // Tracks measured item height

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  void updateScrollIndex(int index) {
    scrollIndex.value = index;
  }

  void updateMaxScrollExtent(double extent) {
    maxScrollExtent.value = extent;
  }

  void updateItemHeight(double height) {
    itemHeight.value = height;
  }
}

class ScrollLinePainter extends CustomPainter {
  final int activeIndex;
  final int totalSegments;

  ScrollLinePainter({required this.activeIndex, required this.totalSegments});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final segmentHeight = size.height / totalSegments;

    for (int i = 0; i < totalSegments; i++) {
      paint.color = i == activeIndex ? AppColor.defaultColor : Colors.grey;
      final startY = i * segmentHeight;
      final endY = (i + 1) * segmentHeight;
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, endY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class FoodItemList extends StatefulWidget {
  const FoodItemList({super.key});

  @override
  _FoodItemListState createState() => _FoodItemListState();
}

class _FoodItemListState extends State<FoodItemList> {
  final ScrollController scrollController = ScrollController();
  late final FoodItemListController controller;
  final GlobalKey _itemKey = GlobalKey(); // Key to measure item height

  final List<Map<String, String>> foodItems = [
    {
      'name': 'Breakfast',
      'price': '\$5000',
      'time': '09:00 AM',
    },
    {
      'name': 'Lunch',
      'price': '\$8000',
      'time': '01:00 PM',
    },
    {
      'name': 'Snacks',
      'price': '\$3000',
      'time': '04:00 PM',
    },
    {
      'name': 'Dinner',
      'price': '\$7000',
      'time': '08:00 PM',
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodItemListController());
    // Measure item height and maxScrollExtent after layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateMeasurements();
    });
    scrollController.addListener(() {
      _updateMeasurements();
      if (controller.maxScrollExtent.value > 0 && controller.itemHeight.value > 0) {
        final offset = scrollController.offset;
        final index = (offset / controller.itemHeight.value)
            .floor()
            .clamp(0, foodItems.length - 1);
        controller.updateScrollIndex(index);
      }
    });
  }

  void _updateMeasurements() {
    // Update item height
    if (_itemKey.currentContext != null) {
      final RenderBox box = _itemKey.currentContext!.findRenderObject() as RenderBox;
      final height = box.size.height + 15.0; // Include margin
      controller.updateItemHeight(height);
    }
    // Update maxScrollExtent
    if (scrollController.hasClients) {
      final extent = scrollController.position.maxScrollExtent;
      controller.updateMaxScrollExtent(extent);
      if (extent == 0) {
        // Retry after next frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateMeasurements();
        });
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    Get.delete<FoodItemListController>();
    super.dispose();
  }

  void _showPopupMenu(BuildContext context, Offset position) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject()! as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColor.grayColor,
      constraints: const BoxConstraints(
        maxWidth: 40, // Enforce max width at the menu level
        minWidth: 40, // Ensure min width matches
      ),
      items: [
        PopupMenuItem(
          height: 60, // Compact height
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 50,
              minWidth: 50,
            ),
            child: ClipRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.delete,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close popup menu
                      Get.dialog(DeleteDialog(
                          message:'Do you want to delete the Note?',
                          onConfirm: () {}));
                    },
                  ),
                  const SizedBox(height: 15), // Reduced spacing
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.bell,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      showSetReminderDialog();
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.task,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {// Close popup menu
                      Get.toNamed(Routes.TASK);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listHeight = controller.itemHeight.value * foodItems.length;
      final scrollIndicatorHeight = listHeight.clamp(0.0, 400.0);

      return Container(
        height: scrollIndicatorHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    key: index == 0 ? _itemKey : null, // Attach key to first item
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1E1E1E),
                    ),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          controller.selectItem(index);
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.selectedIndex.value == index
                                ? AppColor.defaultColor
                                : Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodItems[index]['name']!,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            foodItems[index]['price']!,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Time: ${foodItems[index]['time']}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                          onTapDown: (details) {
                            _showPopupMenu(context, details.globalPosition);
                          },
                          child: SvgPicture.asset(ImageAssets.menu)),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 10,
                height: scrollIndicatorHeight,
                child: CustomPaint(
                  painter: ScrollLinePainter(
                    activeIndex: controller.scrollIndex.value,
                    totalSegments: foodItems.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}