import 'package:flutter/material.dart';
import 'package:shopora/main/myappbar.dart';
import 'package:shopora/main/navbar.dart';
import 'package:shopora/servise/api/getproducts.dart';
import 'package:shopora/widget/category/category_body.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  static const categoryRoute = "/categories";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    isLoaded();
  }

  final List<String> categories = [];
  final List productsList = [];
  final GetProducts products = GetProducts();
  void isLoaded() async {
    await fetchProductsCategories();
  }

  fetchProductsCategories() async {
    try {
      final allProducts = await products.fetchProducts();
      for (var element in allProducts) {
        if (!categories.contains(element['category'])) {
          categories.add(element['category']);
        }
        setState(() {
          productsList.add(element);
        });
      }
      // categories.add("");
      print("allProducts =============> $categories");
    } on Exception catch (err) {
      throw Exception("Error is Happened in get products");
    }
  }

  // List<String> getImagesOfProductByCategory(String category) {
  //   final List<String> result = [];
  //   print(" category => ${category}");
  //   for (var product in productsList) {
  //     if (product['category'] == category) {
  //       result.add(product['images'][0]);
  //     }
  //   }
  //   return result;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappbar(context),
      endDrawer: navbar(context),
      body: CatgeoryBody(productsList: productsList, category: categories),
    );
  }
}
