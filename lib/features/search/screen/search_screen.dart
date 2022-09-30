import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/loader.dart';
import 'package:flutter_ecomerce_tutorial/features/home/widgets/address_box.dart';
import 'package:flutter_ecomerce_tutorial/features/product_details/sceenes/product_details_sceenes.dart';
import 'package:flutter_ecomerce_tutorial/features/search/services/search_services.dart';
import 'package:flutter_ecomerce_tutorial/features/search/widget/search_product.dart';

import '../../../constants/global_variables.dart';
import '../../../model/product.dart';

class SearchScreen extends StatefulWidget {
  static const String routerName = "/search-screen";
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? productList;
  SearchService searchService = SearchService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchedProduct();
  }

  void fetchSearchedProduct() async {
    productList =
        await searchService.fetchCategoryProducts(context, widget.searchQuery);
    setState(() {});
  }

  void navigateToScreenSearch(String query) {
    Navigator.pushNamed(context, SearchScreen.routerName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradinet),
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
                                    fontWeight: FontWeight.w500, fontSize: 17)),
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
      body: productList == null
          ? Loader()
          : Column(
              children: [
                const AddressBox(),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: productList!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetail.routeName,
                                    arguments: productList![index]);
                              },
                              child:
                                  SearchProduct(product: productList![index]));
                        }))
              ],
            ),
    );
  }
}
