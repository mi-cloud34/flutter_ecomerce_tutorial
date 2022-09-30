import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/constants/global_variables.dart';
import 'package:flutter_ecomerce_tutorial/features/account/widgets/below_app_bar.dart';
import 'package:flutter_ecomerce_tutorial/features/account/widgets/top_buttons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:const BoxDecoration(gradient: GlobalVariables.appBarGradinet),
          ), 
          title:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset("assets/images/amazon_in.png",width: 120,height: 45,color:Colors.black),
              ),
              Container(
                padding:const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                children:const [
                  Padding(padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_outlined),),
                  Icon(Icons.search)
                ],
                ),
              )
            ]
          )
        ),
        
      ),
   body:Column(children: const [
    BelowAppBar(),
    TopButton()
    ],)
    );
  }
}
