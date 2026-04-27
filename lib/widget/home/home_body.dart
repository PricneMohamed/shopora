import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopora/main/carousel_widget.dart';
import 'package:shopora/main/loading_widget.dart';
import 'package:shopora/screens/product_screen.dart';
import 'package:shopora/servise/api/getproducts.dart';
import 'package:shopora/utils/constant.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  @override
  final GetProducts getProducts = GetProducts();
  fetchProducts() async {
    try {
      final data = await getProducts.fetchProducts();
      print("data =>>>>>>>>>>>>>>> $data");
      setState(() {
        productList = data;
        isLoading = false;
      });
    } on Exception catch (err) {
      setState(() {
        errMessage = err.toString();
        isLoading = false;
      });
      return;
    }
  }

  List<dynamic> productList = [];
  bool isLoading = true;
  String errMessage = "";

  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingWidget();
    }

    // final List beauty = productList
    //     .where((prod) => prod['category'] == 'beauty')
    //     .toList();

    List getProductsFromCategory(String cat) {
      final categorySelector = productList
          .where((product) => product['category'] == cat)
          .toList();

      return categorySelector;
    }

    print(
      "productList ==> ${getProductsFromCategory("beauty")[0]['images'][0]}",
    );
    print(
      "productList ==> ${getProductsFromCategory("beauty").contains('id')}",
    );

    final List beauty = getProductsFromCategory("beauty");
    final List fragrances = getProductsFromCategory("fragrances");
    final List furniture = getProductsFromCategory("furniture");
    final List groceries = getProductsFromCategory("groceries");

    return SingleChildScrollView(
      child: Column(
        spacing: 60,
        children: [
          CarouselWidget(
            mtListCarousel: [
              "images/banner/b1.png",
              "images/banner/b1.png",
              "images/banner/b1.png",
              "images/banner/b1.png",
              "images/banner/b1.png",
            ],
          ),
          GridView(
            padding: EdgeInsets.all(5),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 5 / 6,
            ),
            children: [
              Container(
                child: Image.asset("images/banner/b2.jpg", fit: BoxFit.cover),
              ),
              Container(
                child: Image.asset("images/banner/b3.jpg", fit: BoxFit.cover),
              ),
              Container(
                child: Image.asset("images/banner/b5.jpg", fit: BoxFit.cover),
              ),
              Container(
                child: Image.asset("images/banner/b4.jpg", fit: BoxFit.cover),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 80,
              children: [
                CategoryOfProduct(
                  category: beauty,
                  title: "Beauty",
                  icon: Icon(Icons.spa, color: kcolor1, size: 35),
                ),
                CategoryOfProduct(
                  category: fragrances,
                  title: "Fragrances",
                  icon: Icon(Icons.local_florist, color: kcolor1, size: 35),
                ),
                CategoryOfProduct(
                  category: furniture,
                  title: "Furniture",
                  icon: Icon(Icons.forest, color: kcolor1, size: 35),
                ),
                CategoryOfProduct(
                  category: groceries,
                  title: "Groceries",
                  icon: Icon(Icons.food_bank, color: kcolor1, size: 35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryOfProduct extends StatelessWidget {
  const CategoryOfProduct({
    super.key,
    required this.title,
    required this.category,
    required this.icon,
  });

  final List<dynamic> category;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 15,
          children: [
            Text("$title", style: Theme.of(context).textTheme.titleLarge),
            icon,
          ],
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
          ),
          items: category.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductScreen.productRoute,
                      arguments: {"id": i['id']},
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(i['images'][0]),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}









    // {
    //   "id": 1,
    //   "title": "Essence Mascara Lash Princess",
    //   "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
    //   "category": "beauty",
    //   "price": 9.99,
    //   "discountPercentage": 10.48,
    //   "rating": 2.56,
    //   "stock": 99,
    //   "tags": [
    //     "beauty",
    //     "mascara"
    //   ],
    //   "brand": "Essence",
    //   "sku": "BEA-ESS-ESS-001",
    //   "weight": 4,
    //   "dimensions": {
    //     "width": 15.14,
    //     "height": 13.08,
    //     "depth": 22.99
    //   },
    //   "warrantyInformation": "1 week warranty",
    //   "shippingInformation": "Ships in 3-5 business days",
    //   "availabilityStatus": "In Stock",
    //   "reviews": [
    //     {
    //       "rating": 3,
    //       "comment": "Would not recommend!",
    //       "date": "2025-04-30T09:41:02.053Z",
    //       "reviewerName": "Eleanor Collins",
    //       "reviewerEmail": "eleanor.collins@x.dummyjson.com"
    //     },
    //     {
    //       "rating": 4,
    //       "comment": "Very satisfied!",
    //       "date": "2025-04-30T09:41:02.053Z",
    //       "reviewerName": "Lucas Gordon",
    //       "reviewerEmail": "lucas.gordon@x.dummyjson.com"
    //     },
    //     {
    //       "rating": 5,
    //       "comment": "Highly impressed!",
    //       "date": "2025-04-30T09:41:02.053Z",
    //       "reviewerName": "Eleanor Collins",
    //       "reviewerEmail": "eleanor.collins@x.dummyjson.com"
    //     }
    //   ],
    //   "returnPolicy": "No return policy",
    //   "minimumOrderQuantity": 48,
    //   "meta": {
    //     "createdAt": "2025-04-30T09:41:02.053Z",
    //     "updatedAt": "2025-04-30T09:41:02.053Z",
    //     "barcode": "5784719087687",
    //     "qrCode": "https://cdn.dummyjson.com/public/qr-code.png"
    //   },
    //   "images": [
    //     "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
    //   ],
    //   "thumbnail": "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"
    // },