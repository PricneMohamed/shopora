import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopora/main/loading_widget.dart';
import 'package:shopora/screens/product_screen.dart';
import 'package:shopora/servise/provider/favorit.dart';
import 'package:shopora/utils/constant.dart';

class ProductBody extends StatefulWidget {
  ProductBody({
    super.key,
    required this.productDetails,
    required this.productsList,
  });

  @override
  Map<String, dynamic> productDetails;
  List<dynamic> productsList;
  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  int currentNumOfProduct = 1;
  bool isLoading = true;

  Widget build(BuildContext context) {
    print("object ${widget.productDetails}");

    Size size = MediaQuery.of(context).size;

    final List products = widget.productsList.where((test) {
      return test['category'] == widget.productDetails['category'];
    }).toList();

    final productsImages = products.map((i) {
      return i;
    }).toList();

    final double myRating = widget.productDetails['rating'];

    if (products.isNotEmpty) {
      isLoading = false;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageStacker(size: size, widget: widget),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  productTitle(widget: widget),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              currentNumOfProduct += 1;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text(
                          "$currentNumOfProduct",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 30,
                                color: Colors.black54,
                              ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (currentNumOfProduct > 1) {
                              setState(() {
                                currentNumOfProduct -= 1;
                              });
                            }
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          Icon(Icons.category, size: 30),
                          productCategory(widget: widget),
                        ],
                      ),
                      SizedBox(height: 30),

                      productTags(widget: widget),
                    ],
                  ),
                  SizedBox(height: 30),

                  Column(
                    spacing: 10,
                    children: [
                      ProductPrice(widget: widget),
                      ProductDiscount(widget: widget),
                    ],
                  ),

                  SizedBox(height: 20),

                  AddToCartWidget(),
                  SizedBox(height: 40),

                  ProductOfRating(myRating: myRating, widget: widget),

                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      spacing: 50,
                      children: [
                        Text(
                          "Other Products You May Like",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(fontSize: 25),
                        ),

                        isLoading
                            ? LoadingWidget()
                            : CarouselOtherProducts(productsImages),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider CarouselOtherProducts(List<dynamic> productsImages) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.33,
        height: 200.0,
        autoPlay: true,
      ),
      items: productsImages.map((i) {
        print("i => ${i}");
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductScreen.productRoute,
                  arguments: {'id': i['id']},
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(child: Image.network(i['images'][0])),
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
      }).toList(),
    );
  }
}

class ProductOfRating extends StatelessWidget {
  const ProductOfRating({
    super.key,
    required this.myRating,
    required this.widget,
  });

  final double myRating;
  final ProductBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: List<Icon>.generate((myRating.ceil()), (index) {
                return Icon(Icons.star, color: Colors.amber, size: 40);
              }),
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Text(
              widget.productDetails['description'],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Add To Cart",
        style: Theme.of(
          context,
        ).textTheme.headlineMedium!.copyWith(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        backgroundColor: kcolor2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class ProductDiscount extends StatelessWidget {
  const ProductDiscount({super.key, required this.widget});

  final ProductBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.price_change, size: 30),

          Text(
            "\$\ ${widget.productDetails['discountPercentage']}",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.widget});

  final ProductBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.discount, size: 30),
          Text(
            "\$\ ${widget.productDetails['price']}",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}

class productTags extends StatelessWidget {
  const productTags({super.key, required this.widget});

  final ProductBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(Icons.tag, size: 30),
        ...widget.productDetails['tags']?.map((i) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kcolor2,
            ),
            padding: EdgeInsets.all(8),
            child: Text(
              "$i",
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(color: Colors.white),
            ),
          );
        }),
      ],
    );
  }
}

class productCategory extends StatefulWidget {
  const productCategory({super.key, required this.widget});

  final ProductBody widget;

  @override
  State<productCategory> createState() => _productCategoryState();
}

class _productCategoryState extends State<productCategory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fprovider = Provider.of<FavoritProvider>(context);
    bool iconColorState = fprovider.isFound(widget.widget.productDetails['id']);

    print("iconColorState => ${iconColorState}");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kcolor2,
              ),
              padding: EdgeInsets.all(8),
              child: Text(
                "${widget.widget.productDetails['category']}",
                style: Theme.of(
                  context,
                ).textTheme.displayMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(width: size.width * 0.4),

        AnimatedScale(
          scale: iconColorState == true ? 1 : 1.2,
          duration: Duration(milliseconds: 200),
          child: IconButton(
            onPressed: () {
              setState(() {
                String title = 'Dialog Title';
                String desc = 'Dialog description here.............';
                void btnCancelOnPress() {}
                ;
                void btnOkOnPress() {}
                ;
                Icon ic = Icon(Icons.abc);

                if (!iconColorState) {
                  fprovider.addToFavoritList(widget.widget.productDetails);
                  iconColorState = true;
                } else {
                  fprovider.removeFromFavoritList(
                    widget.widget.productDetails['id'],
                  );
                  iconColorState = false;
                }
              });
            },
            icon: Icon(
              iconColorState == false ? Icons.favorite_border : Icons.favorite,
              size: 35,
              color: iconColorState == false ? Colors.grey : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class productTitle extends StatelessWidget {
  const productTitle({super.key, required this.widget});

  final ProductBody widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.productDetails['title']}",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class ImageStacker extends StatelessWidget {
  const ImageStacker({super.key, required this.size, required this.widget});

  final Size size;
  final ProductBody widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: kcolor3, shape: BoxShape.circle),
          // width: size.width * 0.8,
          height: size.height * 0.3,
        ),

        Positioned(
          top: -20,
          right: 0,
          child: Image.network(
            widget.productDetails["images"][0],
            width: size.width * 0.9,
          ),
        ),
      ],
    );
  }
}
