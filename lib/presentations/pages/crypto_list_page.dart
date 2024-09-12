import 'package:crypto_curency_list/services/crypto_coins/crypto_coins_service.dart';
import 'package:flutter/material.dart';

import '../../services/models/crypto_coin.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  List<CryptoCoin>? _crytoCoinsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currency List"),
      ),
      body: (_crytoCoinsList == null)
          ? const SizedBox()
          : ListView.separated(
              itemCount: _crytoCoinsList!.length,
              separatorBuilder: (context, item) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _crytoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.download),
          onPressed: () async {
            _crytoCoinsList = await CryptoCoinsService().getCoinsList();
            setState(() {});
          }),
    );
  }
}
