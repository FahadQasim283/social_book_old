import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social_book/Model/user_model/user_model.dart';
import 'package:social_book/View%20Model/post.dart';
import 'package:social_book/View%20Model/user.dart';
import 'dart:math';

class PostContainer extends StatefulWidget {
  const PostContainer({super.key});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  UserModelData userData = UserModelData();
  PostModelData post = PostModelData();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.55,
      child: FutureBuilder(
        future: userData.getUserData(),
        builder: (
          context,
          AsyncSnapshot<UserModel> snapshot,
        ) {
          post.getPostData();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SpinKitFadingCircle(
              color: Colors.amber,
            ));
          }
          if (post.postModel == null) {
            return const Center(
              child: Text("post empty"),
            );
          }
          if (!snapshot.hasData) {
            return const Text("Not Data ");
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.users!.length,
              itemBuilder: (context, index) {
                int time = Random().nextInt(60);
                return Column(
                  children: [
                    postHeader(
                        name: snapshot.data!.users![index].firstName.toString(),
                        info: "${time}m ago",
                        details: post.postModel!.photos![index].description,
                        profileImageUrl:
                            snapshot.data!.users![index].image.toString()),
                    postData(post.postModel!.photos![index].url.toString()),
                    postFooter(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget postFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        footerComponent(
          icon: CupertinoIcons.hand_thumbsup,
          ontap: () {},
        ),
        footerComponent(
          icon: CupertinoIcons.chat_bubble,
          ontap: () {},
        ),
        footerComponent(
          icon: CupertinoIcons.arrowshape_turn_up_right,
          ontap: () {},
        ),
      ],
    );
  }

  Widget footerComponent({IconData? icon, VoidCallback? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        height: MediaQuery.sizeOf(context).height * 0.05,
        width: MediaQuery.sizeOf(context).width * 0.27,
        child: Icon(icon),
      ),
    );
  }

  Widget postHeader({
    String? profileImageUrl,
    String? name,
    String? info,
    String? details,
  }) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: InkWell(
                onTap: () {},
                child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: NetworkImage(profileImageUrl!)),
              ),
              title: Text(name!),
              subtitle: Text(info!),
              trailing: PopupMenuButton(onSelected: (value) {
                if (value == 'More') {
                } else {}
              }, itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "More",
                    child: Text("More Options"),
                  ),
                  const PopupMenuItem(
                    value: "hide",
                    child: Text("Hide Posts"),
                  ),
                ];
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(details!),
            ),
          ],
        ));
  }

  Widget postData(String imageUrl) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: Center(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
