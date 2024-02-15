import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:social_book/Constants/Colors/colors.dart';

class ProductDetails extends StatefulWidget {
  final String? id;
  final String? title;
  final String? price;
  final String? description;
  final String? category;
  final String? image;
  final String? rating;
  final List<String>? photos;
  final String? brand;

  const ProductDetails(
      {super.key,
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.brand,
      this.photos});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.richCalculatorInnerButtonColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              productImage(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.135,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.photos!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Image.network(widget.photos![index]);
                        },
                      ),
                      child: Card(
                        child: Image(
                          image: NetworkImage(widget.photos![index].toString()),
                          width: MediaQuery.sizeOf(context).width * 0.28,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(170, 19, 19, 19),
                        Color.fromARGB(122, 70, 125, 25)
                      ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: productData(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: MyColors.buttonSampleColor,
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text("Back")),
    );
  }

  Widget productImage() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Image.network(widget.image!);
          },
        );
      },
      child: Card(
        child: Image(
          height: MediaQuery.sizeOf(context).height * 0.2,
          image: NetworkImage(widget.image!),
        ),
      ),
    );
  }

  Widget productData() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          useableBox(key: "Product ID:", value: widget.id),
          useableBox(key: "Product :", value: widget.title),
          useableBox(key: "Discrtiption :", value: widget.description),
          useableBox(key: "Category :", value: widget.category),
          useableBox(key: "Brand :", value: widget.brand),
          useableBox(key: "Price :", value: "${widget.price} USD"),
          ratingBox(
            key: "Rating :",
            value: widget.rating,
          ),
        ],
      ),
    );
  }

  Widget ratingBox({key, value}) {
    return Card(
      child: ListTile(
        subtitle: PieChart(
            chartLegendSpacing: 10,
            animationDuration: const Duration(milliseconds: 1500),
            chartRadius: 70,
            chartType: ChartType.ring,
            colorList: const [
              MyColors.currencyPositiveGreen,
              MyColors.headLightRed
            ],
            legendOptions: const LegendOptions(
              legendPosition: LegendPosition.top,
              showLegendsInRow: true,
            ),
            chartValuesOptions:
                const ChartValuesOptions(showChartValuesInPercentage: true),
            dataMap: {"Total": 5, "Current ": double.parse(value)}),
        title: Text(
          "Rating : $value",
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }

  Widget useableBox({key, value}) {
    return Card(
      child: ListTile(
        leading: Text(
          key.toString(),
        ),
        title: Text(
          value.toString(),
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
