import 'package:flutter/material.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/home/presentation/pages/home_screen.dart';
import 'package:foody/features/orders/presentation/pages/orders_screen.dart';
import 'package:foody/features/profile/presentation/pages/profile_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> buildScreens = [ const HomeScreen(), const OrdersScreen(), ProfileScreen()];
  PersistentTabController controller = PersistentTabController(initialIndex: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:PersistentTabView(
          controller: controller,
          navBarHeight: 70,
          tabs: [
            PersistentTabConfig(
              screen: HomeScreen(),
              item: ItemConfig(
                activeForegroundColor: ConstColor().mainColor,
                icon: Icon(AntDesign.home_fill,size: 35,),
              ),
            ),
            PersistentTabConfig(
              screen:  OrdersScreen(),
              item: ItemConfig(
                activeForegroundColor: ConstColor().mainColor,
                icon: const Icon(Icons.shopping_bag,size: 35,),
              ),
            ),
            PersistentTabConfig(
              screen: const ProfileScreen(),
              item: ItemConfig(
                activeForegroundColor: ConstColor().mainColor,
                icon: const Icon(Icons.person,size: 35,),
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
            ),
          ),
        ),
    );
  }
}
