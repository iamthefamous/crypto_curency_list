part of 'crypto_list_bloc.dart';

@immutable
abstract class CryptoListState extends Equatable{}

final class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CryptoListLoading extends CryptoListState{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CryptoListLoaded extends CryptoListState{
  final List<CryptoCoin> coinsList;

  CryptoListLoaded({required this.coinsList});

  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? exception;

  CryptoListLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
