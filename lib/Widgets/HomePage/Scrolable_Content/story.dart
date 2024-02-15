import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.135,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.28,
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(fit: BoxFit.fill, imageUrl: urls[index].toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> urls = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6B5lf6Bdvk66mJZq9th8yMoKUGG0YQMIbdw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzgXe_RbkRoXlHm9fCTD1VMFHUQuOM0Uu3ZA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9joggPkM9JK4sgayh21DwcI8K05lFZ1ihmQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTubXSjZVHXDpM55w9vMBZe_-OR0iOmmz78drS2O_EluiZ13pvyoWI_LPWHdIoGwHLVW7k&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFpgREaKo8EXECDiXUonlukNHQ24Pb-eUPt2kt5lIPIQB1wSRDECO1izyVNuI7EwIF2k8&usqp=CAU",
];
