import 'dart:convert';
import 'package:checkoutapplepay/sdk/Model/TokenResModel/TokenResModel.dart';
import 'package:checkoutapplepay/sdk/lib/Checkout.dart';
import 'package:http/http.dart' as http;
import 'package:checkoutapplepay/Model/ProductInfoModel.dart';
import 'package:checkoutapplepay/component/Card.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class CheckoutPage extends StatelessWidget {
  final ProductInfoModel productInfo;
  const CheckoutPage({Key? key, required this.productInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /////
    /////  Caution
    /////  The function just for the testing purpose, don't use it on the production.
    /////  Make sure remove the secret key from the client before publish to prevent Expose.
    /////  This Function should be deployed on the backend only
    Future<void> processPayment(String? token) async {
      Uri paymentEndpoint = Uri.https("api.sandbox.checkout.com", "/payments");

      Map<String, String> header = {
        "Authorization": "sk_test_89c07eec-8e54-4d5e-88da-ef59ee08b12d",
        "Content-Type": "application/json"
      };
      Map body = {
        "source": {"type": "token", "token": token!},
        "amount": productInfo.price * 100,
        "currency": "HKD"
      };

      http.Response paymentRes = await http.post(paymentEndpoint,
          headers: header, body: jsonEncode(body));

      Map json = jsonDecode(paymentRes.body);

      if (json["status"] == null) {
        throw json["error_type"];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Color.fromRGBO(12, 19, 63, 1),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: 16,
          ),
          ProductCard(
            productName: productInfo.productName,
            price: productInfo.price,
          ),
          SizedBox(
            height: 32,
          ),
          _PaymentMethodSection(),
          SizedBox(
            height: 16,
          ),
          _SummarySection(
            itemName: productInfo.productName,
            price: productInfo.price,
          ),
          SizedBox(
            height: 16,
          ),
          ApplePayButton(
            height: 40,
            paymentConfigurationAsset: 'ApplePayConfig.json',
            paymentItems: [
              PaymentItem(
                  amount: productInfo.price.toString(),
                  label: 'Total',
                  status: PaymentItemStatus.final_price),
            ],
            style: ApplePayButtonStyle.black,
            type: ApplePayButtonType.buy,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: (data) async {
              try {
                Map<String, dynamic> applePayToken = jsonDecode(data["token"]);
                TokenResModel res = await Checkout(
                        "pk_test_23f4d92d-7655-4cf0-9d59-134fce674bb7",
                        isSandbox: true)
                    .token()
                    .ApplePay(applePayToken);
                await processPayment(res.token);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Payment Successful")));
              } catch (err) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(err.toString())));
              }
            },
            onError: (err) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(err.toString())));
            },
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  const _PaymentMethodSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: TextStyle(
              color: Color.fromRGBO(12, 19, 63, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        RadioListTile(
          value: true,
          groupValue: true,
          onChanged: (v) {},
          title: Text("Apple Pay"),
        )
      ],
    );
  }
}

class _SummarySection extends StatelessWidget {
  final String itemName;
  final num price;
  const _SummarySection({Key? key, required this.itemName, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: TextStyle(
              color: Color.fromRGBO(12, 19, 63, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              itemName,
              style: TextStyle(
                color: Color.fromRGBO(12, 19, 63, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "HK${r"$"} ${price.toString()}",
              style: TextStyle(
                color: Color.fromRGBO(12, 19, 63, 1),
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        )
      ],
    );
  }
}
