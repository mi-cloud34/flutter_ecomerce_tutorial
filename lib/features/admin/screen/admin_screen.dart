import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constants/global_variables.dart';

class AdminSceen extends StatefulWidget {
  const AdminSceen({Key? key}) : super(key: key);

  @override
  State<AdminSceen> createState() => _AdminSceenState();
}

class _AdminSceenState extends State<AdminSceen> {
   int _page = 0;
  double bottomBarWidt = 42;
  double bottomBarBorderWidt = 5;
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
     
  const  Center(child: Text("Posts Page"),),
  const  Center(child: Text("Analitics Page"),),
  const  Center(child: Text("Carts Page"),)
  ];
  

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
             Text("Admin",style: TextStyle(fontWeight: FontWeight.bold),)
            ]
          )
        ),
        
      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavbarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomBarWidt,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GlobalVariables.selectedNavbarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidt),
                    ),
                  ),
                  child: Icon(Icons.home_outlined)),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomBarWidt,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavbarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidt),
                    ),
                  ),
                  child: Icon(Icons.analytics_outlined)),
              label: ""),
               BottomNavigationBarItem(
              icon: Container(
                  width: bottomBarWidt,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavbarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidt),
                    ),
                  ),
                  child: Icon(Icons.all_inbox_outlined)),
              label: ""),
         ],
      ),
    );
  }
}
