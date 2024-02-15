import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.01,
          vertical: MediaQuery.sizeOf(context).width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          yourImage(),
          yourPost(),
          photoColumn(),
        ],
      ),
    );
  }

  Widget yourImage() {
    return InkWell(
      onTap: () {},
      child: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR77iOanUEwD6cR1bth7E0y0jnAJCnDH6Zp1Q&usqp=CAU"),
      ),
    );
  }

  Widget yourPost() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(244, 238, 238, 238),
          height: MediaQuery.sizeOf(context).height * 0.08,
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.04),
            child: const Text(
              "What's on your mind?",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget photoColumn() {
    return InkWell(
      onTap: () {},
      child: const Column(
        children: [Icon(Icons.photo_library_outlined), Text("Photo")],
      ),
    );
  }
}
