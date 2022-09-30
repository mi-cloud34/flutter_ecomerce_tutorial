import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/bottom_bar.dart';
import 'package:flutter_ecomerce_tutorial/features/admin/screen/add_product_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/auth/screen/auth_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/home/screen/category_detail_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/home/screen/home_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/product_details/sceenes/product_details_sceenes.dart';
import 'package:flutter_ecomerce_tutorial/features/search/screen/search_screen.dart';
import 'package:flutter_ecomerce_tutorial/model/product.dart';

import 'features/adress/scenees/adress_scennes.dart';

Route<dynamic> generateRouter(RouteSettings routerSetting) {
  switch (routerSetting.name) {
    case AuthScreen.routerName:
      return MaterialPageRoute(
          settings: routerSetting, builder: (_) => const AuthScreen());
    case HomeScreen.routerName:
      return MaterialPageRoute(
          settings: routerSetting, builder: (_) => const HomeScreen());
    case BottomBar.routerName:
      return MaterialPageRoute(
          settings: routerSetting, builder: (_) => const BottomBar());
    case AddProductScreen.routerName:
      return MaterialPageRoute(
          settings: routerSetting, builder: (_) => const AddProductScreen());
    case CategoryDetailScreen.routerName:
      var category = routerSetting.arguments as String;
      return MaterialPageRoute(
          settings: routerSetting,
          builder: (_) =>CategoryDetailScreen(category: category));
     case SearchScreen.routerName:
      var searchQuery = routerSetting.arguments as String;
      return MaterialPageRoute(
          settings: routerSetting,
          builder: (_) =>SearchScreen(searchQuery: searchQuery));
      case ProductDetail.routeName:
      var product = routerSetting.arguments as Product;
      return MaterialPageRoute(
          settings: routerSetting,
          builder: (_) =>ProductDetail(product: product));
      case AddressScreen.routeName:
      var totalAmount = routerSetting.arguments as String;
      return MaterialPageRoute(
        settings: routerSetting,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );         
    default:
      return MaterialPageRoute(
          settings: routerSetting,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Screen does not exists"),
                ),
              ));
  }
}
