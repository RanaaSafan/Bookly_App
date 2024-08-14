import 'package:booky_app/features/home/data/models/sale_info.dart';
import 'package:booky_app/features/home/data/models/volume_info.dart';

import 'access_info.dart';

class Books {
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Books({
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });

  factory Books.fromJson(Map<dynamic, dynamic> json) => Books(
    volumeInfo: json['volumeInfo'] == null
        ? null
        : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    saleInfo: json['saleInfo'] == null
        ? null
        : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
    accessInfo: json['accessInfo'] == null
        ? null
        : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
  );
}
