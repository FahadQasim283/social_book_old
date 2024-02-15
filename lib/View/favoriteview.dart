import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:social_book/Constants/Colors/colors.dart';
import 'package:social_book/View/product_detail_view.dart';
import 'package:social_book/Widgets/CommonWidgets/custombuttons.dart';

import '../Model/ProductModel/product_model.dart';

class FavoriteProduct extends StatefulWidget {
  const FavoriteProduct({super.key});

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.currenciesPageBackground,
      body: ProductModel.favoriteProducts.isEmpty
          ? Center(
              child: Text(
              "No Items",
              style: Theme.of(context).textTheme.titleMedium,
            ))
          : SizedBox(
              height: double.infinity,
              child: ListView.builder(
                itemCount: ProductModel.favoriteProducts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: MyColors.currenciesNameColor,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: PieChart(
                                      animationDuration:
                                          const Duration(milliseconds: 1500),
                                      chartRadius: 70,
                                      colorList: const [
                                        MyColors.currencyPositiveGreen,
                                        MyColors.headLightRed
                                      ],
                                      chartLegendSpacing: 10,
                                      chartType: ChartType.ring,
                                      legendOptions: const LegendOptions(
                                        legendPosition: LegendPosition.bottom,
                                        showLegendsInRow: true,
                                      ),
                                      chartValuesOptions:
                                          const ChartValuesOptions(
                                              showChartValuesInPercentage:
                                                  true),
                                      dataMap: {
                                        "Total": 5,
                                        "Current ": double.parse(ProductModel
                                            .favoriteProducts[index].rating
                                            .toString())
                                      }),
                                  leading: Text(
                                    "Rating ${double.parse(ProductModel.favoriteProducts[index].rating.toString())}",
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  detailColumn(index),
                                  imageColumn(index),
                                ],
                              ),
                            ),
                            buttonRow(index),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget buttonRow(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: MyTextButton(
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  id: ProductModel.favoriteProducts[index].id.toString(),
                  title: ProductModel.favoriteProducts[index].title,
                  description: ProductModel.favoriteProducts[index].description,
                  image: ProductModel.favoriteProducts[index].thumbnail,
                  price: ProductModel.favoriteProducts[index].price.toString(),
                  rating:
                      ProductModel.favoriteProducts[index].rating.toString(),
                  category: ProductModel.favoriteProducts[index].category,
                  brand: ProductModel.favoriteProducts[index].brand.toString(),
                  photos: ProductModel.favoriteProducts[index].images,
                ),
              ));
        },
        text: "Details",
      ),
    );
  }

  Widget detailColumn(int index) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ProductModel.favoriteProducts[index].title.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${ProductModel.favoriteProducts[index].price} USD"),
        ],
      ),
    );
  }

  Widget imageColumn(int index) {
    return ClipOval(
      // borderRadius: BorderRadius.circular(100),
      child: Image(
          width: MediaQuery.sizeOf(context).width * 0.5,
          image: NetworkImage(
              ProductModel.favoriteProducts[index].thumbnail.toString())),
    );
  }
}
