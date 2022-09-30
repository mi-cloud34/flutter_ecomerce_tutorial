
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/bottom_bar.dart';
import 'package:flutter_ecomerce_tutorial/constants/global_variables.dart';
import 'package:flutter_ecomerce_tutorial/features/admin/screen/admin_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/auth/screen/auth_screen.dart';
import 'package:flutter_ecomerce_tutorial/features/auth/services/auth_service.dart';
import 'package:flutter_ecomerce_tutorial/features/home/screen/home_screen.dart';
import 'package:flutter_ecomerce_tutorial/providers/user_provider.dart';
import 'package:flutter_ecomerce_tutorial/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRouter(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ?Provider.of<UserProvider>(context).user.type=="user"?BottomBar()
            :AdminSceen()
            : const AuthScreen()
            );
  }
}
