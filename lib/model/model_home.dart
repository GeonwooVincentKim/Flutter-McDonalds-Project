import 'package:flutter/material.dart';


class ModelHome{
  final String homeID;
  final String homeTitle;
  final String homeImage;

  ModelHome({
    @required this.homeID,
    @required this.homeTitle,
    @required this.homeImage
  });

  // Bring the selected element from the Parent-Model List.
  factory ModelHome.fromHomeInfo(ModelHome home){
    return ModelHome(
      homeID: home.homeID ?? '',
      homeTitle: home.homeTitle ?? '',
      homeImage: home.homeImage ?? ''
    );
  }

  factory ModelHome.initializeHome(){
    return ModelHome(
      homeID: '',
      homeTitle: '',
      homeImage: ''
    );
  }
}