import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utilis.dart';
import '../../../model/product.dart';
import '../../../providers/user_provider.dart';
class SearchService{
   Future<List<Product>> fetchCategoryProducts(BuildContext context ,String searchQuery) async {
    final userProvider = Provider.of<UserProvider>(context);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/admin/products/search/$searchQuery"),
        headers: {
          'Content-Type': 'application/json,charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  
}