import 'package:crypto_curency_list/presentations/crypto_currency_list.dart';
import 'package:crypto_curency_list/services/abstract_crypto_coins_service.dart';
import 'package:crypto_curency_list/services/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
void main() {
  GetIt.I.registerLazySingleton<AbstractCoinstService>(
    () => CryptoCoinsService(dio: Dio()),
  );
  runApp(const MyApp());
}





