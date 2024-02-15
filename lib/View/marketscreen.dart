import 'package:flutter/material.dart';
import 'package:social_book/View/favoriteview.dart';
import 'package:social_book/Widgets/MarketPage/product_view.dart';
import 'package:social_book/Widgets/MarketPage/app_bar_row.dart';

import '../Constants/Colors/colors.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: MyColors.currenciesPageBackground,
        drawer: const Drawer(
          backgroundColor: MyColors.interlacedChatPurple,
        ),
        appBar: AppBar(
          title: const StaticRow(),
          backgroundColor: MyColors.interlacedChatPurple,
          elevation: 1,
          bottom: TabBar(
              indicatorColor: Colors.amber,
              unselectedLabelColor: Colors.grey.shade400,
              tabs: const [
                Tab(
                  child: Text("All"),
                ),
                Tab(
                  child: Text("Favorite"),
                ),
                Tab(
                  child: Text("Cart"),
                )
              ]),
        ),
        body: TabBarView(children: [
          const ProductView(),
          const FavoriteProduct(),
          Center(
              child: Text(
            "No Items ",
            style: Theme.of(context).textTheme.titleMedium,
          )),
        ]),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: MyColors.accountPurple,
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text("Back")),
      ),
    );
  }
}
