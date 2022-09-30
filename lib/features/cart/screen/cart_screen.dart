import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/features/cart/widget/cart_subtotal.dart';
import 'package:flutter_ecomerce_tutorial/features/home/widgets/address_box.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';
import '../../adress/scenees/adress_scennes.dart';
import '../../search/screen/search_screen.dart';
import '../widget/cart_product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   void navigateToScreenSearch(String query) {
    Navigator.pushNamed(context, SearchScreen.routerName,arguments: query);
  }
  void navigateToAddress() {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
     
    );
  }
  @override
  Widget build(BuildContext context) {
     final user = context.watch<UserProvider>().user;
     int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
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
      body: SingleChildScrollView(child: Column(
        children: [
          AddressBox(),
          CartSubtotal(),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Proceed to Buy (${user.cart.length} items)',
                onTap:navigateToAddress,
                //() => navigateToAddress(sum),
                color: Colors.yellow[600],
              ),
            ),
             const SizedBox(height: 15),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(height: 5),
            ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(
                  index: index,
                );
              },
            ),
        ],
      ),),
    );
  }
}
