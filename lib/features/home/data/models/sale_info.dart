import 'package:booky_app/features/home/data/models/retail_price.dart';

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  RetailPrice? retailPrice;

  SaleInfo({this.country, this.saleability, this.isEbook, this.retailPrice});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'] as String?,
    saleability: json['saleability'] as String?,
    isEbook: json['isEbook'] as bool?,
    retailPrice: json['retailPrice'] != null
        ? RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'retailPrice': retailPrice?.toJson(),
  };
}
