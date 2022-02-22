part of Checkout;

class _Token {
  late Uri _tokenEndpoint;
  late Map<String, String> header;

  _Token(String _pk, String _baseUrl) {
    _tokenEndpoint = Uri.https(_baseUrl, "/tokens");

    header = {"Authorization": _pk, "Content-Type": "application/json"};
  }

  Future<TokenResModel> ApplePay(Map<String, dynamic> applePayTokenData) async {
    Map body = {"type": "applepay", "token_data": applePayTokenData};

    http.Response res = await http.post(_tokenEndpoint,
        headers: header, body: jsonEncode(body));
    String jsonString = res.body;

    TokenResModel TokenRes = TokenResModel.fromJson(jsonDecode(jsonString));
    return TokenRes;
  }
}
