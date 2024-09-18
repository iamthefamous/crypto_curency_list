import 'dart:async';

import 'package:crypto_curency_list/services/abstract_crypto_coins_service.dart';
import 'package:crypto_curency_list/services/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/crypto_coin_tile.dart';


class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinstService>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Crypto Currency List"),
        ),
        body: RefreshIndicator(
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  return ListView.separated(
                    itemCount: state.coinsList.length,
                    separatorBuilder: (context, item) => const Divider(),
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];
                      return CryptoCoinTile(coin: coin);
                    },
                  );
                }
                if (state is CryptoListLoadingFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Something went wrong", style: theme.textTheme.bodyMedium,),
                        Text("Please try again later", style: theme.textTheme.labelSmall,),
                        const SizedBox(height: 30,),
                        TextButton(
                            onPressed: (){
                              _cryptoListBloc.add(LoadCryptoList());
                            },
                            child: const Text("Try later")),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }
          ),
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          }
        ),


        // (_crytoCoinsList == null)
        //   ? const SizedBox()
        //   :
        );
  }
}
