import 'package:flutter/material.dart';

class ContainerConfig with ChangeNotifier {
  double _width = 150.0;
  double _height = 150.0;
  double _borderRadius = 20.0;

  double get width => _width;
  double get height => _height;
  double get borderRadius => _borderRadius;

  void updateWidth(double newWidth) {
    _width = newWidth;
    notifyListeners();
  }

  void updateHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void updateBorderRadius(double newRadius) {
    _borderRadius = newRadius;
    notifyListeners();
  }
}
