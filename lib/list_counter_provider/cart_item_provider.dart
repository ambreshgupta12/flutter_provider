import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/list_counter_provider/CartItem.dart';

class CartItemProvider with ChangeNotifier {

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

  int _objectIndex;


  int get objectIndex => _objectIndex;

  void objectIndexs(int value) {

    _objectIndex = value;
    notifyListeners();
  }

  List<CartItem> _cartItemList = [
    new CartItem(
        true,
        'assets/images/daily_hourly_kurties_for_jeans.png',
        'Kurties for jeans',
        '19.80',
        '\$19.80',
        '50%',
        'S',
        ['Black', 'White', 'Red', 'Greeen', 'Yellow'],
        [
          Colors.black,
          Color(0xffCAA77D),
          Color(0xffE8CDCD),
          Color(0xff83A7CF),
          Color(0xffA691EB),
        ],
        1,
        ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        2,
        1,
        80,
        80
    ),
    new CartItem(
        false,
        'assets/images/featured_category_shirt.png',
        'Pleated Skirt',
        '19.80',
        '\$19.80',
        '50%',
        'S',
        ['Black', 'White', 'Red', 'Greeen', 'Yellow'],
        [
        Colors.black,
        Color(0xffCAA77D),
       Color(0xffE8CDCD),
       Color(0xff83A7CF),
       Color(0xffA691EB),]
  ,
  1,
  ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
  2,
  1,

  80

  ,

  80

  ),
    new CartItem(false,
  'assets/images/daily_hourly_kurties_for_jeans.png',
  'Kurties for jeans',
  '19.80',
  '\$19.80',
  '50%',
  'S',
  ['Black', 'White', 'Red', 'Greeen','Yellow'],
  [
  Colors.black
  ,
  Color(0xffCAA77D), Color(0xffE8CDCD), Color(0xff83A7CF), Color(0xffA691EB),],
  1,
  ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
  2,
  1,
  70,
  70),
    new CartItem(
  false,
  'assets/images/featured_category_shirt.png',
  'Pleated Skirt',
  '19.80',
  '\$19.80',
  '50%',
  'S',
  ['Black', 'White', 'Red', 'Greeen', 'Yellow'],
  [
  Colors.black,
  Color(0xffCAA77D),
  Color(0xffE8CDCD),
  Color(0xff83A7CF),
  Color(0xffA691EB),]
  ,
  1,
  ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
  2,
  1,

  80

  ,

  80

  ),

  ];



  List<CartItem> get cartItemList => _cartItemList;

  set cartItemList(List<CartItem> value) {
    _cartItemList = value;
    notifyListeners();
  }









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

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
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