import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'screens/list_chung_khoan_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(context),
        confineInSafeArea: true,
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
            colorBehindNavBar: const Color(0xff2A5CAA),
            borderRadius: BorderRadius.circular(0.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        ),
        navBarHeight: 67,
        navBarStyle: NavBarStyle.style3,
        onItemSelected: (index) {
          ///
        },
      ),
    );
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      Container(),
      ListChungKhoanScreen(),
      Container(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      getNavBarItem(
        iconSvgPath: "assets/images/svg/menu-market.svg",
        title: "Thị trường",
      ),
      getNavBarItem(
        iconSvgPath: "assets/images/svg/menu-priceboard.svg",
        title: "Bảng giá",
      ),
      getNavBarItem(
        iconSvgPath: "assets/images/svg/menu-transaction.svg",
        title: "Giao dịch",
        //onPressed: onPlaceOrderPressed
      ),
      getNavBarItem(
        iconSvgPath: "assets/images/svg/menu-search.svg",
        title: "Tìm kiếm",
        // onPressed: null,
      ),
      PersistentBottomNavBarItem(
        icon: _buildIconNotification(context, const Color(0xff2A5CAA)),
        inactiveIcon: _buildIconNotification(
            context, const Color(0xff000000).withOpacity(0.7)),
        title: "Thông báo",
        activeColorPrimary: const Color(0xff2A5CAA),
        inactiveColorPrimary: const Color(0xff000000).withOpacity(0.7),
      ),
    ];
  }

  _buildIconNotification(context, Color color) {
    return Stack(
      children: [
        SvgPicture.asset("assets/images/svg/menu-notification.svg",
            color: color),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: const Text(
              '9',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  PersistentBottomNavBarItem getNavBarItem(
      {required String iconSvgPath, String? title, Function? onPressed}) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(iconSvgPath, color: const Color(0xff2A5CAA)),
      inactiveIcon: SvgPicture.asset(iconSvgPath,
          color: const Color(0xff000000).withOpacity(0.7)),
      title: title,
      activeColorPrimary: const Color(0xff2A5CAA),
      inactiveColorPrimary: const Color(0xff000000).withOpacity(0.7),
      onPressed: onPressed as dynamic Function(BuildContext?)?,
    );
  }
}                                                                                                                                










