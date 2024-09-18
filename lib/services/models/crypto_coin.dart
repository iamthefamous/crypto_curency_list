import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String name;
  final String priceInUsd;
  final String image;

  const CryptoCoin({
    required this.name,
    required this.priceInUsd,
    required this.image,
  });

  @override
  List<Object?> get props => [name, priceInUsd, image];

}