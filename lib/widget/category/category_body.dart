import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopora/main/loading_widget.dart';
import 'package:shopora/utils/constant.dart';

class CatgeoryBody extends StatefulWidget {
  const CatgeoryBody({
    super.key,
    required this.productsList,
    required this.category,
  });

  final List<dynamic> productsList;
  final List<dynamic> category;

  @override
  State<CatgeoryBody> createState() => _CatgeoryBodyState();
}

class _CatgeoryBodyState extends State<CatgeoryBody> {
  @override
  late String selectedCategory = "All";

  Widget build(BuildContext context) {
    // bool isLoaded = widget.productsList.isEmpty || widget.category.isEmpty;

    print("category => ${widget.category}");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 5,
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                        print(" selectedCategory => ${selectedCategory}");
                      },
                      borderRadius: BorderRadius.circular(10),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      elevation: 10,
                      icon: Icon(Icons.category),
                      dropdownColor: Color(0xFFEEE8E2),
                      hint: Text(
                        "Select Category",
                        style: TextStyle(fontSize: 19),
                      ),
                      items: [
                        for (var cat in widget.category)
                          DropdownMenuItem<String>(
                            value: cat,
                            child: Text(cat),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            widget.productsList.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: 100),
                      LoadingWidget(),
                      SizedBox(height: 100),
                    ],
                  )
                : SectionOfProducts(
                    selectedCategory: "Beauty",
                    productsList: widget.productsList,
                  ),
            widget.productsList.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: 100),
                      LoadingWidget(),
                      SizedBox(height: 100),
                    ],
                  )
                : SectionOfProducts(
                    selectedCategory: "Fragrances",
                    productsList: widget.productsList,
                  ),
            widget.productsList.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: 100),
                      LoadingWidget(),
                      SizedBox(height: 100),
                    ],
                  )
                : SectionOfProducts(
                    selectedCategory: "Groceries",
                    productsList: widget.productsList,
                  ),
          ],
        ),
      ),
    );
  }
}

class SectionOfProducts extends StatelessWidget {
  const SectionOfProducts({
    super.key,
    required this.selectedCategory,
    required this.productsList,
  });

  final String selectedCategory;
  final List<dynamic> productsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        productTitle(title: "${selectedCategory} Products"),
        SizedBox(height: 20),
        CarouselOtherProducts(productsList, selectedCategory),
      ],
    );
  }
}

class productTitle extends StatelessWidget {
  const productTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text("${title}", style: Theme.of(context).textTheme.titleLarge);
  }
}

CarouselSlider CarouselOtherProducts(List<dynamic> products, String category) {
  return CarouselSlider(
    options: CarouselOptions(
      viewportFraction: 0.33,
      height: 200.0,
      autoPlay: true,
    ),
    items: products
        .where((i) => i['category'] == category.toLowerCase().trim())
        .map((i) {
          print("i => ${i}");
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(
                  //   ProductScreen.productRoute,
                  //   arguments: {'id': i['id']},
                  // );
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Image.network(i['images'][0]),
                        Expanded(
                          child: Text(
                            i["title"].toString().split(' ')[0],
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$\ ${i['price']}".toString(),
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontSize: 15, color: kcolor1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        })
        .toList(),
  );
}
