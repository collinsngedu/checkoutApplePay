import 'package:checkoutapplepay/Checkout/CheckoutPage.dart';
import 'package:checkoutapplepay/Component/Card.dart';
import 'package:checkoutapplepay/Model/ProductInfoModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductInfoModel> dummy = [
      ProductInfoModel("iPhone 12", 5000),
      ProductInfoModel("Apple Watch", 3000),
      ProductInfoModel("Airpods Pro", 1500),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("CKO Apple Pay Demo"),
        backgroundColor: Color.fromRGBO(12, 19, 63, 1),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: 16,
          ),
          ...dummy
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                                  productInfo: e,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ProductCard(
                      price: e.price,
                      productName: e.productName,
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
