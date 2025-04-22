import 'package:esortcli/app/modules/category/controllers/category_controller.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/delete_dialog.dart';
import 'package:esortcli/app/widgets/edge_button.dart';
import 'package:esortcli/app/widgets/rename_dialog.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class CreateNoteDialog extends GetView<CategoryController> {
  const CreateNoteDialog({Key? key, required this.onConfirm}) : super(key: key);
  final VoidCallback onConfirm;

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
                      Get.dialog(DeleteDialog(onConfirm: () {}));
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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColor.backgroundColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: SvgPicture.asset(
                  ImageAssets.cross,
                  height: 24,
                  width: 24,
                  color: AppColor.defaultColor,
                ),
                onPressed: () => Get.back(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(width: 32, height: 27.5),
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
                          ...[
                            ImageAssets.agenda,
                            ImageAssets.creativity,
                            ImageAssets.learning,
                            ImageAssets.progress,
                          ].map(
                            (asset) => GestureDetector(
                              onLongPressStart: (details) {
                                _showPopupMenu(context, details.globalPosition);
                              },
                              onTap: () {
                                Get.toNamed(Routes.CATAGORY_LIST);
                              },
                              child: SvgPicture.asset(
                                asset,
                                height: 65,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      RoundButton(
                        buttonColor: AppColor.defaultColor,
                        title: 'Add New category',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        textColor: AppColor.whiteColor,
                        width: double.infinity,
                        height: 50,
                        radius: 10,
                        onPress: () {
                          Navigator.pop(context);
                          Get.dialog(
                            RenameDialog(
                              onConfirm: () {},
                              title: "Create New Category",
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      RoundButton(
                        buttonColor: AppColor.defaultColor,
                        title: 'Add to Task',
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        textColor: AppColor.whiteColor,
                        width: double.infinity,
                        height: 50,
                        radius: 10,
                        onPress: () {
                          Navigator.pop(context);
                          Get.dialog(
                            RenameDialog(
                              onConfirm: () {},
                              title: "Create New Category",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
