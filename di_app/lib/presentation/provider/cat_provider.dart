import 'package:di_app/data/cat_repository.dart';
import 'package:di_app/domain/model/cat_image.dart';
import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  CatImage? _catImage;
  CatImage? get catImage => _catImage;
  final CatRepository catRepository;
  CatProvider(this.catRepository);

  void getImage() async {
    _catImage = await catRepository.getCatImage();
    notifyListeners();
  }
}
