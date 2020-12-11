import 'package:flutter/material.dart';

class ModelSpecial{
  final String spID;
  final String spName;
  final String spImage;
  final int spPrice;
  final String spReleaseDate;
  final String spReleaseYear;
  final String spReleaseMonth;

  ModelSpecial({
    @required this.spID,
    @required this.spName,
    @required this.spImage,
    @required this.spPrice,
    this.spReleaseDate,
    this.spReleaseYear,
    this.spReleaseMonth
  });

  factory ModelSpecial.fromSpecialMenuList(ModelSpecial special){
    return ModelSpecial(
      spID: special.spID ?? '',
      spName: special.spName ?? '',
      spImage: special.spImage ?? '',
      spPrice: special.spPrice ?? 0,
      spReleaseDate: special.spReleaseDate ?? '',
      spReleaseYear: special.spReleaseYear ?? '',
      spReleaseMonth: special.spReleaseMonth ?? ''
    );
  }

  factory ModelSpecial.fromSpecialMenuMap(Map<String, dynamic> special){
    return ModelSpecial(
      spID: special['spID'] ?? '',
      spName: special['spName'] ?? '',
      spImage: special['spImage'] ?? '',
      spPrice: special['spPrice'] ?? 0,
      spReleaseDate: special['spReleaseDate'] ?? '',
      spReleaseYear: special['spReleaseYear'] ?? '',
      spReleaseMonth: special['spReleaseMonth'] ?? ''
    );
  }

  factory ModelSpecial.initialize(ModelSpecial special){
    return ModelSpecial(
      spID: '',
      spName: '',
      spImage: '',
      spPrice: 0,
      spReleaseDate: '',
      spReleaseYear: '',
      spReleaseMonth: ''
    );
  }
}