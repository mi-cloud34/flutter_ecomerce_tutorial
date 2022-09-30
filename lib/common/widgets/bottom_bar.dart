import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_tutorial/constants/global_variables.dart';
import 'package:flutter_ecomerce_tutorial/features/account/screens/account_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/cart/screen/cart_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/home/screen/home_screen.dart';
import 'package:flutter_ecomerce_tutorial/providers/user_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routerName = "/actual-home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidt = 42;
  double bottomBarBorderWidt = 5;
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
   const CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final cartLen = context.watch<UserProvider>().user.cart;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavbarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomBarWidt,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavbarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidt),
                    ),
                  ),
                  child: Icon(Icons.home_outlined)),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomBarWidt,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavbarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidt),
                    ),
                  ),
                  child: Icon(Icons.person_outline)),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomBarWidt,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _page == 2
                              ? GlobalVariables.selectedNavbarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidt),
                    ),
                  ),
                  child: Badge(
                      elevation: 0,
                      badgeContent: Text(cartLen.toString()),
                      badgeColor: Colors.white,
                      child: const Icon(Icons.shopping_cart_outlined))),
              label: ""),
        ],
      ),
    );
  }
}
