import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social_book/Constants/Colors/colors.dart';
import 'package:social_book/View%20Model/product.dart';
import 'package:social_book/View/product_detail_view.dart';

import '../../Model/ProductModel/product_model.dart';
import '../CommonWidgets/custombuttons.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => ProductViewState();
}

class ProductViewState extends State<ProductView> {
  ProductModelLatestData productData = ProductModelLatestData();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today's Picks"),
                        Text("Kamara 34 km"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: productData.getProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: SpinKitFadingCircle(
                        color: Colors.amber,
                      ));
                    }
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const Center(
                        child: Text("No data"),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: snapshot.data!.products!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MyColors.compexDrawerCanvasColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.sizeOf(context).height * 0.2,
                                                width: double.infinity,
                                                child: Image(
                                                  image: NetworkImage(
                                                    snapshot.data!.products![index].thumbnail
                                                        .toString(),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Text(
                                                    "Price   ${snapshot.data!.products![index].price} USD"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: MyColors.currenciesNameColor,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                MyTextButton(
                                                  fontWeight: FontWeight.normal,
                                                  ontap: () {},
                                                  text: "Add to Cart",
                                                ),
                                                MyTextButton(
                                                  fontWeight: FontWeight.normal,
                                                  ontap: () {
                                                    ProductModel.favoriteProducts
                                                        .add(snapshot.data!.products![index]);
                                                  },
                                                  text: "Add to Favorite",
                                                ),
                                                MyTextButton(
                                                  fontWeight: FontWeight.normal,
                                                  ontap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => ProductDetails(
                                                            id: snapshot.data!.products![index].id
                                                                .toString(),
                                                            title: snapshot
                                                                .data!.products![index].title,
                                                            description: snapshot
                                                                .data!.products![index].description,
                                                            image: snapshot
                                                                .data!.products![index].thumbnail,
                                                            price: snapshot
                                                                .data!.products![index].price
                                                                .toString(),
                                                            rating: snapshot
                                                                .data!.products![index].rating
                                                                .toString(),
                                                            brand: snapshot
                                                                .data!.products![index].brand
                                                                .toString(),
                                                            category: snapshot
                                                                .data!.products![index].category,
                                                            photos: snapshot
                                                                .data!.products![index].images,
                                                          ),
                                                        ));
                                                  },
                                                  text: "More Details",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
