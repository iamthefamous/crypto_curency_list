
import 'package:crypto_curency_list/services/models/crypto_coin.dart';

abstract class AbstractCoinstService{
  Future<List<CryptoCoin>> getCoinsList();
}