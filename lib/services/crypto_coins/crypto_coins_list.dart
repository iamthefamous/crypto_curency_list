import 'package:dio/dio.dart';

class CryptoCoinsList {

  Future<List<String>> getCoinNames() async {
    const link = 'https://min-api.cryptocompare.com/data/blockchain/list?api_key=eb61571bcd9d54ac3e1ff80ea6d062fced6e1f9bd18d891e420819a4edd6be1b';
    final response = await Dio().get(link);

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["Data"] as Map<String, dynamic>;

    final coinNames = dataRaw.keys.toList();

    return coinNames;
  }
}
