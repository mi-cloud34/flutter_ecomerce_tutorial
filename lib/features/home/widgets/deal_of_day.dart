import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/loader.dart';
import 'package:flutter_ecomerce_tutorial/features/home/services/home_service.dart';
import 'package:flutter_ecomerce_tutorial/features/product_details/sceenes/product_details_sceenes.dart';
import 'package:flutter_ecomerce_tutorial/model/product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  HomeService homeService = HomeService();
  Product? product;
  @override
  void initState() {
    fetchDealOfDay();
    super.initState();
  }

  void fetchDealOfDay() async {
    homeService.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(context, ProductDetail.routeName, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isNotEmpty
            ? const SizedBox()
            : GestureDetector(
              onTap: navigateToDetailScreen,
              child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Text(
                        'Deal of the day',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 232,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\$99.9 ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Mesut",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: product!.images
                            .map((e) => Image.network(
                                  e,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15)
                          .copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "See All Deals",
                        style: TextStyle(color: Colors.cyan[600]),
                      ),
                    )
                  ],
                ),
            );
  }
}
