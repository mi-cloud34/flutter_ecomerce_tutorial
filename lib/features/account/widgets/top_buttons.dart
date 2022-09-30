import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ecomerce_tutorial/features/account/widgets/account_button.dart';

class TopButton extends StatelessWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
        children: [
          AccountButton(onTap:() => {}, text: "Your Orders"),
           AccountButton(onTap:() => {}, text: "Turn Seler")
          ],),
          SizedBox(height: 10,),
            Row(
        children: [
          AccountButton(onTap:() => {}, text: "LogOut"),
           AccountButton(onTap:() => {}, text: "Your Wish List")
          ],),
          ],
    );
  }
}
