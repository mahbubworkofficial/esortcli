import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/delete_dialog.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/colors/app_color.dart';

class FoodItemListController extends GetxController {
  var selectedIndex = 0.obs;
  var scrollIndex = 0.obs;
  var maxScrollExtent = 0.0.obs;
  var itemHeight = 120.0.obs;

  void selectItem(int index) => selectedIndex.value = index;

  void updateScrollIndex(int index) => scrollIndex.value = index;

  void updateMaxScrollExtent(double extent) => maxScrollExtent.value = extent;

  void updateItemHeight(double height) => itemHeight.value = height;
}

class ScrollLinePainter extends CustomPainter {
  final int activeIndex;
  final int totalSegments;

  ScrollLinePainter({required this.activeIndex, required this.totalSegments});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final segmentHeight = size.height / totalSegments;

    for (int i = 0; i < totalSegments; i++) {
      paint.color = i == activeIndex ? AppColor.defaultColor : Colors.grey;
      canvas.drawLine(
        Offset(size.width / 2, i * segmentHeight),
        Offset(size.width / 2, (i + 1) * segmentHeight),
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
  State<FoodItemList> createState() => _FoodItemListState();
}

class _FoodItemListState extends State<FoodItemList> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey _itemKey = GlobalKey();
  final controller = Get.put(FoodItemListController());

  final List<Map<String, String>> foodItems = [
    {'name': 'Breakfast', 'price': '\$5000', 'time': '09:00 AM'},
    {'name': 'Lunch', 'price': '\$8000', 'time': '01:00 PM'},
    {'name': 'Snacks', 'price': '\$3000', 'time': '04:00 PM'},
    {'name': 'Dinner', 'price': '\$7000', 'time': '08:00 PM'},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateMeasurements());

    scrollController.addListener(() {
      _updateMeasurements();
      if (controller.maxScrollExtent.value > 0 &&
          controller.itemHeight.value > 0) {
        final offset = scrollController.offset;
        final index = (offset / controller.itemHeight.value).floor().clamp(
          0,
          foodItems.length - 1,
        );
        controller.updateScrollIndex(index);
      }
    });
  }

  void _updateMeasurements() {
    if (_itemKey.currentContext != null) {
      final RenderBox box =
          _itemKey.currentContext!.findRenderObject() as RenderBox;
      final height = box.size.height + 15.0;
      controller.updateItemHeight(height);
    }
    if (scrollController.hasClients) {
      final extent = scrollController.position.maxScrollExtent;
      controller.updateMaxScrollExtent(extent);
      if (extent == 0) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateMeasurements();
        });
      }
    }
  }

  void _showPopupMenu(BuildContext context, Offset position) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
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
      constraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
      items: [
        PopupMenuItem(
          height: 60,
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50, maxWidth: 50),
            child: ClipRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(
                        DeleteDialog(
                          message: 'Do you want to delete the Note?',
                          onConfirm: () {},
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      ImageAssets.delete,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showSetReminderDialog();
                    },
                    child: SvgPicture.asset(
                      ImageAssets.bell,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(Routes.TASK);
                    },
                    child: SvgPicture.asset(
                      ImageAssets.task,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  void dispose() {
    scrollController.dispose();
    Get.delete<FoodItemListController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final scrollIndicatorHeight =
          (controller.itemHeight.value * foodItems.length).clamp(0.0, 400.0);

      return SizedBox(
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
                  return Obx(
                    () => Container(
                      key: index == 0 ? _itemKey : null,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF1E1E1E),
                      ),
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () => controller.selectItem(index),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.defaultColor,
                                width: 2,
                              ),
                            ),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    controller.selectedIndex.value == index
                                        ? AppColor.defaultColor
                                        : Colors.transparent,
                                border: Border.all(
                                  color: AppColor.blackColor,
                                  width: 2.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodItems[index]['name']!,
                              style: _textStyle(),
                            ),
                            Text(
                              foodItems[index]['price']!,
                              style: _textStyle(),
                            ),
                            Text(
                              'Time: ${foodItems[index]['time']!}',
                              style: _textStyle(),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTapDown: (details) {
                            _showPopupMenu(context, details.globalPosition);
                          },
                          child: SvgPicture.asset(ImageAssets.menu),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Obx(
                () => SizedBox(
                  width: 10,
                  height: scrollIndicatorHeight,
                  child: CustomPaint(
                    key: ValueKey(controller.scrollIndex.value),
                    painter: ScrollLinePainter(
                      activeIndex: controller.scrollIndex.value,
                      totalSegments: foodItems.length,
                    ),
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
