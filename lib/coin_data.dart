import 'dart:convert';
import 'package:http/http.dart' as http;

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

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Map<String, String> crytoCurrencyMap = {};
  Future<Map<String, String>> getCoinData(String currency) async {
    for (String cryptoCoin in cryptoList) {
      http.Response response =
          await http.get('$bitcoinAverageURL/$cryptoCoin$currency');
      if (response.statusCode == 200) {
        String data = response.body;
        var fetchedCurrency = jsonDecode(data)['last'].toStringAsFixed(0);
        crytoCurrencyMap[cryptoCoin] = fetchedCurrency;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return crytoCurrencyMap;
  }
}
