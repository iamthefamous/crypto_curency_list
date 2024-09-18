import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_curency_list/services/abstract_crypto_coins_service.dart';
import 'package:crypto_curency_list/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.abstractCoinstService) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListState) {
          emit(CryptoListLoading());
        }
        final coinsList = await abstractCoinstService.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      }catch (e){
        emit(CryptoListLoadingFailure(exception: e));
      }
      finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinstService abstractCoinstService;
}