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
  Future<double> getCoinData() async {

    http.Response response = await http.get('$bitcoinAverageURL/BTCUSD');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data)['last'];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
