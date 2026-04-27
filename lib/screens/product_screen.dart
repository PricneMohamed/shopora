import 'package:flutter/material.dart';
import 'package:shopora/main/loading_widget.dart';
import 'package:shopora/main/myappbar.dart';
import 'package:shopora/main/navbar.dart';
import 'package:shopora/servise/api/getproduct.dart';
import 'package:shopora/servise/api/getproducts.dart';
import 'package:shopora/utils/constant.dart';
import 'package:shopora/widget/product/product_body.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  static const productRoute = "/product-details";

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isLoading = true;
  bool firstFlag = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (firstFlag) {
      final myId =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      fetchproduct(myId['id']);
      getProducts();
      firstFlag = false;
    }
  }

  final GetproductDetails getProduct = GetproductDetails();

  final GetProducts products = GetProducts();

  Map<String, dynamic> productDetails = {};

  List<dynamic> productsList = [];

  Future<List<dynamic>> getProducts() async {
    try {
      final fetchProducts = await products.fetchProducts();

      productsList = fetchProducts;
      return fetchProducts;
    } on Exception catch (err) {
      throw Exception("Error is Happened in get products");
    }
  }

  Future<Map<String, dynamic>> fetchproduct(int id) async {
    try {
      final myproduct = await getProduct.fetchAProduct(id);

      print("myproduct===============< ${myproduct}");
      productDetails = myproduct;
      return myproduct;
    } on Exception catch (e) {
      throw Exception("error ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    // if(isLoading) return LoadingWidget();

    return Scaffold(
      appBar: myappbar(context, kpageName: productDetails['title'] ?? kName),
      endDrawer: navbar(context),
      body: isLoading
          ? LoadingWidget()
          : ProductBody(
              productDetails: productDetails,
              productsList: productsList,
            ),
    );
  }
}
