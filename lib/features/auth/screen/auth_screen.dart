import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/custom_button.dart';
import 'package:flutter_ecomerce_tutorial/common/widgets/custom_field.dart';
import 'package:flutter_ecomerce_tutorial/constants/global_variables.dart';
import 'package:flutter_ecomerce_tutorial/features/auth/services/auth_service.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routerName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _paswordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController,
        password: _paswordController,
        name: _nameController);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController,
      password: _paswordController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                "Create Acount",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key:_signUpFormKey,
                    child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: "Name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _paswordController,
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: "Sign Up",
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        })
                  ],
                )),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              title: const Text(
                "Sign-In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key:_signInFormKey,
                    child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _paswordController,
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: "Sign Up",
                        onTap: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        })
                  ],
                )),
              ),
          ],
        ),
      )),
    );
  }
}
