
import 'package:crypto_curency_list/services/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print(coin.image);
    return ListTile(
        leading: Image.network(coin.image,),
        title: Text(coin.name, style: theme.textTheme.bodyMedium,),
        subtitle: Text("${coin.priceInUsd}\$", style: theme.textTheme.labelSmall),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pushNamed('/coin', arguments: coin.name);
        }
    );
  }
}