import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/loader.dart';
import 'package:flutter_ecomerce_tutorial/features/product_details/sceenes/product_details_sceenes.dart';

import '../../../constants/global_variables.dart';
import '../../../model/product.dart';
import '../services/home_service.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const routerName = "category-detalils";
  final String category;
  const CategoryDetailScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  HomeService homeService = HomeService();
  List<Product>? productList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryProducts();
  }

  void fetchCategoryProducts() async {
    productList =
        await homeService.fetchCategoryProducts(context, widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradinet),
          ),
          title: Text(
            widget.category,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: productList == null
          ? Loader()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Keep shooping for ${widget.category}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      itemCount: productList!.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.4,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetail.routeName,arguments: product);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 0.5)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.network(product.images[0]),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding:
                                    EdgeInsets.only(left: 0, top: 5, right: 15),
                                child: Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
