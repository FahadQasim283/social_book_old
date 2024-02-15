import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_book/Widgets/CommonWidgets/custombuttons.dart';

class AppBarRow1 extends StatelessWidget {
  const AppBarRow1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Social Book",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white
                ),
          ),
          const Spacer(),
          MyIconButton(
            ontap: () {},
            icon: CupertinoIcons.add_circled,
          ),
          MyIconButton(
            ontap: () {},
            icon: CupertinoIcons.search,
            
          ),
          MyIconButton(
            ontap: () {},
            icon: CupertinoIcons.line_horizontal_3,
          ),
        ],
      ),
    );
  }

  Widget cirCularContainer({required IconData iconData}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(iconData),
      ],
    );
  }
}
