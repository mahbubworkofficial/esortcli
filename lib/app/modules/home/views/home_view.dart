import 'package:esortcli/app/modules/home/views/calender_view.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/budget_dialog.dart';
import 'package:esortcli/app/widgets/create_note_dialog.dart';
import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:esortcli/app/widgets/daily_task.dart';
import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:esortcli/app/widgets/rename_dialog.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/assests/image_assets.dart';
import '../../../utils/food_item_list_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  String assetName = ImageAssets.budget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF1E1E1E),
                            border: Border(
                              bottom: BorderSide(
                                color: AppColor.defaultColor,
                                width: 1.0,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: Image.asset('assets/images/avater.png'),
                            title: Text(
                              'Hello Joshitha',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'I am worthy of love and\nrespect',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/light.png'),
                                const SizedBox(width: 10),
                                Image.asset('assets/images/bell.png'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Get.dialog(BudgetDialog(onConfirm: () {}));
                          },
                          child: SizedBox(
                            height: 58,
                            width: double.infinity,
                            child: SvgPicture.asset(
                              assetName,
                              semanticsLabel: 'App Logo',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Creates Note',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.dialog(
                                  CreateNoteDialog(
                                    onConfirm: () {
                                      print('Confirmed!');
                                    },
                                  ),
                                );
                              },
                              child: SvgPicture.asset('assets/svg/save.svg'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        InputTextWidget(
                          hintText: 'Type your note',
                          height: 129.0,
                          onChanged: (value) {
                            print('Text changed: $value');
                          },
                          maxLines: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Needs',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: (){Get.toNamed(Routes.AI);},
                                child: SvgPicture.asset(ImageAssets.ai_logo)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        InputTextWidget(
                          hintText: 'I need Milk for breakfast',
                          height: 129.0,
                          onChanged: (value) {
                            print('Text changed: $value');
                          },
                          maxLines: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Task',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.dialog(
                                      TaskDialog(
                                        onConfirm: () {
                                          print('Confirmed!');
                                        },
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset(ImageAssets.note),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Get.dialog(CalendarView());
                                    // CalendarView();
                                  },
                                  child: SvgPicture.asset(ImageAssets.calender),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        FoodItemList(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RoundButton(
                  buttonColor: AppColor.defaultColor,
                  title: 'Create New Task',
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  textColor: AppColor.whiteColor,
                  width: double.infinity,
                  height: 50,
                  radius: 10,
                  onPress: () {
                    Get.dialog(
                      RenameDialog(
                        onConfirm: () {
                          Get.dialog(DailyTask());
                        },
                        title: "Create New Task",
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
