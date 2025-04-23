import 'package:esortcli/app/modules/catagory_list/views/untitled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/assests/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../widgets/delete_dialog.dart';
import '../../../widgets/rename_dialog.dart';
import '../controllers/catagory_list_controller.dart';

class CatagoryListView extends GetView<CatagoryListController> {
  const CatagoryListView({super.key});

  void _showPopupMenu(BuildContext context, Offset position) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy+20,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColor.grayColor,
      constraints: const BoxConstraints(maxWidth: 40, minWidth: 40),
      items: [
        PopupMenuItem(
          height: 60,
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 50, minWidth: 50),
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
                      Navigator.pop(context);
                      Get.dialog(
                        DeleteDialog(
                          message: 'Do you want to delete the Note?',
                          onConfirm: () {},
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.rename,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(
                        RenameDialog(
                          title: 'Rename the note?',
                          onConfirm: () {},
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.task,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(RenameDialog(onConfirm: () {}));
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.blackColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ImageAssets.back_button,
                              height: 24,
                              width: 12,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Back',
                              style: TextStyle(
                                color: AppColor.defaultColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Agenda',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(() => Untitled());
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.backgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'I have a meeting .........',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (details) {
                                _showPopupMenu(context, details.globalPosition);
                              },
                              child: SvgPicture.asset(ImageAssets.popup_menu),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'I want read book......',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTapDown: (details) {
                              _showPopupMenu(context, details.globalPosition);
                            },
                            child: SvgPicture.asset(ImageAssets.popup_menu),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'I want to go to the park .........',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTapDown: (details) {
                              _showPopupMenu(context, details.globalPosition);
                            },
                            child: SvgPicture.asset(ImageAssets.popup_menu),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Follow up with Bob .........',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTapDown: (details) {
                              _showPopupMenu(context, details.globalPosition);
                            },
                            child: SvgPicture.asset(ImageAssets.popup_menu),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
