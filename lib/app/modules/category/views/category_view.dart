import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:esortcli/app/widgets/edge_button.dart';
import 'package:esortcli/app/widgets/long_press_dialoge.dart';
import 'package:esortcli/app/widgets/rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/delete_dialog.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        // appBar: AppBar(
        //   backgroundColor: AppColor.blackColor,
        //   leading: IconButton(
        //     icon: SvgPicture.asset(
        //       ImageAssets.back_button,
        //       height: 24,
        //       width: 12,
        //     ),
        //     onPressed: () => Get.toNamed(Routes.HOME), // Navigate back using GetX
        //   ),
        //   title: const Text(
        //     'Back',
        //     style: TextStyle(
        //       color: AppColor.defaultColor,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 16,
        //       fontFamily: 'Roboto',
        //     ),
        //   ),
        // ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
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
                      InkWell(
                        onLongPress: () {
                          Get.dialog(
                            // RenameDialog(
                            //   onConfirm: () {
                            //     print('Category deleted');
                            //   },
                            //   // message: 'Do you want to delete this Category?', // Optional custom message
                            // ),
                            LongPressDialoge(),
                          );
                        },
                        child: SvgPicture.asset(
                          ImageAssets.agenda,
                          height: 65,
                          width: double.infinity,
                        ),
                      ),
                       SizedBox(height: 15),
                      SvgPicture.asset(
                        ImageAssets.creativity,
                        height: 65,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 15),
                      SvgPicture.asset(
                        ImageAssets.learning,
                        height: 65,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 15),
                      SvgPicture.asset(
                        ImageAssets.progress,
                        height: 65,
                        width: double.infinity,
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
