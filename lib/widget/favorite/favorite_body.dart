import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopora/servise/provider/favorit.dart';
import 'package:shopora/utils/constant.dart';
import 'package:shopora/utils/dialog.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key, required this.size});

  final Size size;

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    final favoritProvider = Provider.of<FavoritProvider>(context).favoritList;
    final fProvider = Provider.of<FavoritProvider>(context);

    if (favoritProvider.isEmpty) {
      return Center(
        child: Text(
          "Whishlist is Empty :(",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.black87),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.0),
            child: Center(
              child: Text(
                "Whishlist",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoritProvider.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      height: widget.size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: widget.size.width * 0.4,
                                  width: widget.size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Image.network(
                                    favoritProvider[index]['images'][0],
                                    width: widget.size.width * 0.35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: widget.size.width * 0.4,
                                child: Text(
                                  favoritProvider[index]['title'],
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              Text(
                                "Price: \$${favoritProvider[index]['price']}",
                                style: Theme.of(
                                  context,
                                ).textTheme.displayMedium,
                              ),
                              AddToCart(),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                DialogAlert(
                                  Icon(
                                    Icons.warning,
                                    size: 60,
                                    color: Colors.amber,
                                  ),
                                  context,
                                  "Are you sure?",
                                  "This product will be removed from your wishlist.",
                                  () {},
                                  () {
                                    fProvider.removeFromFavoritList(
                                      favoritProvider[index]['id'],
                                    );
                                  },
                                );
                              });
                            },
                            icon: Icon(Icons.close, size: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: kcolor2,
        foregroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.titleSmall,
      ),
      child: Text("Add to Cart"),
    );
  }
}
