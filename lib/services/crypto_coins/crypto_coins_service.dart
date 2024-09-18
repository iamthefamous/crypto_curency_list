import 'package:dio/dio.dart';

import '../abstract_crypto_coins_service.dart';
import '../models/crypto_coin.dart';
import 'crypto_coins_list.dart';

class CryptoCoinsService implements AbstractCoinstService{
  CryptoCoinsService({
    required this.dio,
  });

  final Dio dio;

  final apiKey = '&eb61571bcd9d54ac3e1ff80ea6d062fced6e1f9bd18d891e420819a4edd6be1b';
  final int maxSymbolLimit = 200;
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final coinNames = await CryptoCoinsList().getCoinNames();


    List<List<String>> chunks = [];
    for(var i = 0; i < coinNames.length; i += maxSymbolLimit) {
      final end = (i + maxSymbolLimit > coinNames.length)
          ? coinNames.length
          : i + maxSymbolLimit;
      chunks.add(coinNames.sublist(i, end));
    }
    List<CryptoCoin> finalList = [];
    for (var chunk in chunks) {
      final names = chunk.join(',');
      final link =
          'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$names&tsyms=USD&api_key=$apiKey';

      final response = await dio.get(link);
      final data = response.data as Map<String, dynamic>;
      final dataRAW = data['RAW'] as Map<String, dynamic>;

      final chunkData = dataRAW.entries.map((e) {
        final usdData =
        (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData?['PRICE']?.toString() ?? 'N/A';
        final image = usdData['IMAGEURL'];
        final imageUrl = 'http://cryptocompare.com$image';
        return CryptoCoin(
          name: e.key,
          priceInUsd: price,
          image: imageUrl,
        );
      }).toList();

      finalList.addAll(chunkData);
    }
    return finalList;
  }
}
