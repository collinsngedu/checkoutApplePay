library Checkout;

import 'dart:convert';
import 'package:checkoutapplepay/sdk/Model/TokenResModel/TokenResModel.dart';
import 'package:http/http.dart' as http;

part 'Token.dart';

class Checkout {
  final String _publicKey;
  late String _baseUrl;

  Checkout(this._publicKey, {bool? isSandbox = false}) {
    if (isSandbox!) {
      _baseUrl = "api.sandbox.checkout.com";
    } else {
      _baseUrl = "api.checkout.com";
    }
  }

  _Token token() {
    return _Token(_publicKey, _baseUrl);
  }
}
