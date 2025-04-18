import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:esortcli/app/widgets/edge_button.dart';
import 'package:esortcli/app/widgets/rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/delete_dialog.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({super.key});

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColor.grayColor,
      items: [
        PopupMenuItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    ImageAssets.delete,
                    height: 24,
                    width: 24,
                    color: AppColor.whiteColor,
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close popup menu
                    Get.dialog(
                      DeleteDialog(onConfirm: () {}),
                    );
                  },
                ),
                const SizedBox(height: 15),
                InkWell(
                  child: SvgPicture.asset(
                    ImageAssets.rename,
                    height: 24,
                    width: 24,
                    color: AppColor.whiteColor,
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close popup menu
                    Get.dialog(
                      RenameDialog(onConfirm: () {}),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 27.5,
                                ),
                                Container(
                                  width: 35,
                                  height: 27.5,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: AppColor.defaultColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.defaultColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Category',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColor.defaultColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onLongPressStart: (details) {
                        _showPopupMenu(context, details.globalPosition);
                      },
                        onTap: (){
                          Get.toNamed(Routes.CATAGORY_LIST);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.agenda,
                          height: 65,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupMenu(context, details.globalPosition);
                        },
                        onTap: (){
                          Get.toNamed(Routes.CATAGORY_LIST);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.creativity,
                          height: 65,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupMenu(context, details.globalPosition);
                        },
                        onTap: (){
                          Get.toNamed(Routes.CATAGORY_LIST);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.learning,
                          height: 65,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _showPopupMenu(context, details.globalPosition);
                        },
                        onTap: (){
                          Get.toNamed(Routes.CATAGORY_LIST);
                        },
                        child: SvgPicture.asset(
                          ImageAssets.progress,
                          height: 65,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: EdgeButton(
                buttonColor: AppColor.defaultColor,
                title: 'Add New Section',
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                onPress: () {},
                textColor: AppColor.whiteColor,
                width: double.infinity,
                height: 50,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}