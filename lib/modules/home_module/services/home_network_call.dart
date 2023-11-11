import 'package:http/http.dart' as http;

class HomeNetworkCall {
  // method to get data from an api
  static Future<http.Response> getCryptocurrencies() async {
    String url =
        'https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

    Map<String, String> headers = {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': '89043c4c-456d-4fa5-87c1-cc3f012b3e17',
    };
    final response = http.get(Uri.parse(url), headers: headers);
    return response;
  }

  // method to get data from an api for logo
  static Future<http.Response> getLogo() async {
    String url = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info';
    Map<String, String> headers = {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': '89043c4c-456d-4fa5-87c1-cc3f012b3e17',
    };
    final response = http.get(Uri.parse(url), headers: headers);
    return response;
  }
}
