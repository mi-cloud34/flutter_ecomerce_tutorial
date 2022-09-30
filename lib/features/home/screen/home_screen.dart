import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_tutorial/features/home/widgets/address_box.dart';
import 'package:flutter_ecomerce_tutorial/features/home/widgets/carousel_image.dart';
import 'package:flutter_ecomerce_tutorial/features/home/widgets/deal_of_day.dart';
import 'package:flutter_ecomerce_tutorial/features/home/widgets/top_categories.dart';
import 'package:flutter_ecomerce_tutorial/features/search/screen/search_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToScreenSearch(String query) {
    Navigator.pushNamed(context, SearchScreen.routerName,arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradinet),
              ),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          height: 42,
                          margin: const EdgeInsets.only(left: 15),
                          child: Material(
                            borderRadius: BorderRadius.circular(7),
                            elevation: 1,
                            child: TextFormField(
                              onFieldSubmitted: navigateToScreenSearch,
                              decoration: InputDecoration(
                                  prefixIcon: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(top: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 1)),
                                  hintText: 'Search ',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17)),
                            ),
                          )),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 42,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                    )
                  ])),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddressBox(),
              const SizedBox(
                height: 10,
              ),
              TopCategories(),
              CarouselImage(),
              DealOfDay(),
            ],
          ),
        ));
  }
}
