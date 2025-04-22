import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../routes/app_pages.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<String> _icons = [
    ImageAssets.home,
    ImageAssets.category,
    ImageAssets.ai,
    ImageAssets.settings,
  ];

  final List<String> _routes = [
    Routes.HOME,
    Routes.CATEGORY,
    Routes.AI,
    Routes.SETTINGS,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedIndex();
    });
  }

  void _updateSelectedIndex() {
    final currentRoute = Get.currentRoute;
    final index = _routes.indexOf(currentRoute);
    if (index != -1 && index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      Get.toNamed(_routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateSelectedIndex();
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1E1E1E),
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: List.generate(_icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Container(
            height: 58,
            width: 62,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color:
                    _selectedIndex == index
                        ? AppColor.defaultColor
                        : AppColor.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              _icons[index],
              color: _selectedIndex == index ? Colors.white : Colors.grey,
            ),
          ),
          label: '',
        );
      }),
    );
  }
}
