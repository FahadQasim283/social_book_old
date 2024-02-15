import 'package:flutter/material.dart';
import 'package:social_book/Widgets/HomePage/AppBar/appbar_row1.dart';
import 'package:social_book/Widgets/HomePage/AppBar/appbar_row2.dart';
import 'package:social_book/Widgets/HomePage/Scrolable_Content/createpost.dart';
import 'package:social_book/Widgets/HomePage/Scrolable_Content/post.dart';
import 'package:social_book/Widgets/HomePage/Scrolable_Content/story.dart';

import '../Constants/Colors/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBarRow1(),
              AppBarRow2(),
            ],
          ),
          centerTitle: true,
          backgroundColor: MyColors.complexDrawerBlueGrey,
          elevation: 4,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.15,
        ),
        body: ListView(children: const [
          CreatePost(),
          Divider(color: Color.fromARGB(255, 194, 194, 194), thickness: 4),
          Story(),
          Divider(color: Color.fromARGB(255, 194, 194, 194), thickness: 4),
          Align(alignment: Alignment.centerLeft, child: PostContainer()),
        ]),
      ),
    );
  }
}
