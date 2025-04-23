import 'package:esortcli/app/modules/ai/views/ai_view.dart';
import 'package:esortcli/app/modules/category/views/category_view.dart';
import 'package:esortcli/app/modules/home/views/home_view.dart';
import 'package:esortcli/app/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/res/assests/image_assets.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
     HomeView(),
     CategoryView(),
     AiView(),
     SettingsView(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<String> _icons = [
    ImageAssets.home,
    ImageAssets.category,
    ImageAssets.ai,
    ImageAssets.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1E1E1E),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
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
                color: selectedIndex == index
                    ? AppColor.defaultColor
                    : AppColor.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              _icons[index],
              color: selectedIndex == index ? Colors.white : Colors.grey,
            ),
          ),
          label: '',
        );
      }),
    );
  }
}