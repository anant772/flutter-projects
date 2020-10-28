

import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
String starturl = "https://rest.coinapi.io/v1/exchangerate/";
String apikeey = "E409829E-2606-4E6E-930E-DA0111AF1E50";

class CoinData {
  Future getData(String cur) async {
    Map<String, String> cryptoPrices = {};
    for (int i = 0; i < 3; i++) {
      http.Response response =
          await http.get(starturl + "${cryptoList[i]}/$cur?apikey=" + apikeey);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        //Create a new key value pair, with the key being the crypto symbol and the value being the lastPrice of that crypto currency.
        cryptoPrices[cryptoList[i]] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}
