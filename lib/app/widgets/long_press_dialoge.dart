import 'package:esortcli/app/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';
import 'rename_dialog.dart'; // From previous artifact

class LongPressDialoge extends StatelessWidget {
  const LongPressDialoge({Key? key}) : super(key: key);

  void _showPopupMenu(BuildContext context, Offset position) {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject()! as RenderBox;
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
      color: AppColor.backgroundColor,
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              // Menu items
              ListTile(
                leading: SvgPicture.asset(
                  ImageAssets.rename,
                  height: 24,
                  width: 24,
                  color: AppColor.defaultColor,
                ),
                title: const Text(
                  'Rename',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.whiteColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.dialog(
                    RenameDialog(onConfirm: (){})
                  );
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  ImageAssets.delete,
                  height: 24,
                  width: 24,
                  color: AppColor.defaultColor,
                ),
                title: const Text(
                  'Delete',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.whiteColor,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.dialog(
                    DeleteDialog(onConfirm: (){})
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, 
      child: GestureDetector(
        onLongPressStart: (details) {
          _showPopupMenu(context, details.globalPosition);
        },
        child: ListTile(
          title: const Text(
            'Category',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}