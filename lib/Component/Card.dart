import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final num price;
  const ProductCard({Key? key, required this.productName, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              child: AspectRatio(
                aspectRatio: 1,
                child: Placeholder(),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                      color: Color.fromRGBO(12, 19, 63, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "HK${r"$"} ${price.toString()}",
                  style: TextStyle(
                      color: Color.fromRGBO(12, 19, 63, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
