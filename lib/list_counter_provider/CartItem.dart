  import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  bool _isChecked;
  String _assetsPath;
  String _itemTitle;
  String _itemPrice;
  String _itemDiscount;
  String _itemDiscountPercentage;
  String _size;
  double _width;
  double _height;

  List<String> _colorNameList;
  List<Color> _colorList;
  int _selectedColorIndex;
  List<String> _sizeList;
  int _selectedSizeIndex;
  int _itemCount;


  CartItem(this._isChecked,this._assetsPath, this._itemTitle,
      this._itemPrice, this._itemDiscount, this._itemDiscountPercentage,
      this._size, this._colorNameList, this._colorList,
      this._selectedColorIndex, this._sizeList, this._selectedSizeIndex,
      this._itemCount,this._width,this._height);

  int get itemCount => _itemCount;

  set itemCount(int value) {
    _itemCount = value;
    notifyListeners();
  }

  int get selectedSizeIndex => _selectedSizeIndex;

  set selectedSizeIndex(int value) {
    _selectedSizeIndex = value;
    notifyListeners();
  }

  List<String> get sizeList => _sizeList;

  set sizeList(List<String> value) {
    _sizeList = value;
    notifyListeners();
  }

  int get selectedColorIndex => _selectedColorIndex;

  set selectedColorIndex(int value) {
    _selectedColorIndex = value;
    notifyListeners();
  }

  List<Color> get colorList => _colorList;

  set colorList(List<Color> value) {
    _colorList = value;
    notifyListeners();
  }

  List<String> get colorNameList => _colorNameList;

  set colorNameList(List<String> value) {
    _colorNameList = value;
    notifyListeners();
  }

  String get size => _size;

  set size(String value) {
    _size = value;
    notifyListeners();
  }

  String get itemDiscountPercentage => _itemDiscountPercentage;

  set itemDiscountPercentage(String value) {
    _itemDiscountPercentage = value;
    notifyListeners();
  }

  String get itemDiscount => _itemDiscount;

  set itemDiscount(String value) {
    _itemDiscount = value;
    notifyListeners();
  }

  String get itemPrice => _itemPrice;

  set itemPrice(String value) {
    _itemPrice = value;
    notifyListeners();
  }

  String get itemTitle => _itemTitle;

  set itemTitle(String value) {
    _itemTitle = value;
    notifyListeners();
  }

  String get assetsPath => _assetsPath;

  set assetsPath(String value) {
    _assetsPath = value;
    notifyListeners();
  }

  bool get isChecked => _isChecked;

  void isCheckeds(bool value) {
    print("IS_CHECKED $value");
    _isChecked = value;
    notifyListeners();
    print("IS_CHECKED b $_isChecked");
  }

  double get height => _height;

  set height(double value) {
    _height = value;
    notifyListeners();
  }

  double get width => _width;

  set width(double value) {
    _width = value;
    notifyListeners();
  }


}