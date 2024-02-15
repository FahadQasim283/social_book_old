import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_book/View/marketscreen.dart';
import 'package:social_book/View/newsview.dart';

import '../../CommonWidgets/custombuttons.dart';

class AppBarRow2 extends StatelessWidget {
  const AppBarRow2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyIconButton(
          ontap: () {},
          icon: (CupertinoIcons.house_alt),
        ),
        MyIconButton(
          ontap: () {},
          icon: (CupertinoIcons.person_2),
        ),
        MyIconButton(
          ontap: () {},
          icon: (CupertinoIcons.bubble_right),
        ),
        MyIconButton(
          ontap: () {},
          icon: (CupertinoIcons.bell),
        ),
        MyIconButton(
          ontap: () 
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsView(),));
          },
          icon: (Icons.newspaper),
        ),
        MyIconButton(
          ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MarketScreen(),
                ));
          },
          icon: (CupertinoIcons.cart),
        ),
      ],
    );
  }
}
