
import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/calender.dart';
import 'package:esortcli/app/widgets/delete_dialog.dart';
import 'package:esortcli/app/widgets/rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class CalendarView extends StatelessWidget {
  CalendarView({super.key});

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
        maxWidth: 40,
        minWidth: 40,
      ),
      items: [
        PopupMenuItem(
          height: 60,
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
                      Navigator.pop(context);
                      Get.dialog(DeleteDialog(
                        message: 'Do you want to delete the Note?',
                        onConfirm: () {},
                      ));
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.bell,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(RenameDialog(
                        title: 'Rename the note?',
                        onConfirm: () {},
                      ));
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
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
              const SizedBox(height: 10),
              Calender(),
              const SizedBox(height: 24),
              const Text(
                'Special Task',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                        Get.toNamed(Routes.TASK);},
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
                            color: AppColor.defaultColor,
                            border: Border.all(
                              color: AppColor.blackColor,
                              width: 2.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Marketing',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                ImageAssets.star,
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '\$5000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Time: 09:00 PM',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTapDown: (details) {
                        _showPopupMenu(context, details.globalPosition);
                      },
                      child: const Icon(Icons.more_horiz, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}