import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/bottom_bar.dart';
import 'package:flutter_ecomerce_tutorial/constants/error_handling.dart';
import 'package:flutter_ecomerce_tutorial/constants/utilis.dart';
import 'package:flutter_ecomerce_tutorial/features/home/screen/home_screen.dart';
import 'package:flutter_ecomerce_tutorial/model/user.dart';
import 'package:flutter_ecomerce_tutorial/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/global_variables.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required email,
      required password,
      required name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []
          );
      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json,charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! Loggin with the same Credentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required email,
    required password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json,charset=UTF-8'
          });
      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routerName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUser(
    BuildContext context,
  ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');
      if (token == null) {
        pref.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$uri/tokenİsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json,charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenRes.body);
      if (response) {
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              'Content-Type': 'application/json,charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
