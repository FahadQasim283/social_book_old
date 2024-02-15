import 'package:flutter/cupertino.dart';
import 'package:social_book/Widgets/CommonWidgets/custombuttons.dart';

class StaticRow extends StatelessWidget {
  const StaticRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "MarketPlace",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          MyIconButton(ontap: () {}, icon: CupertinoIcons.search),
        ],
      ),
    );
  }
}
