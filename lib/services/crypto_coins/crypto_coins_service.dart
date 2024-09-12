import 'package:dio/dio.dart';

import '../models/crypto_coin.dart';

class CryptoCoinsService {
  final apiKey = '&api_key=eb61571bcd9d54ac3e1ff80ea6d062fced6e1f9bd18d891e420819a4edd6be1b';
  Future<List<CryptoCoin>> getCoinsList() async {
    final link =
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ADA&tsyms=USD$apiKey';
    final response = await Dio().get(link);
    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;
    final finalData = dataRAW.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final image = usdData['IMAGEURL'];
      final imageUrl = 'http://cryptocompare.com$image';
      return CryptoCoin(
        name: e.key,
        priceInUsd: price,
        image: imageUrl,
      );
    }).toList();
    //print(finalData as String);
    return finalData;
  }
}
