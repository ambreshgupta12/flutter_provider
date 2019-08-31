import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/FoodItem.dart';

class Foodlist extends StatefulWidget {
  @override
  _FoodlistState createState() => _FoodlistState();
}

class _FoodlistState extends State<Foodlist> {
  int _selectedindex = 1;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _widgetOptions = [
      Text('Index 0: Dashboard'),
      Text('Index 1: Earings'),
      Text('Index 2: My Profile'),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        /*body:Center(
          child: _widgetOptions.elementAt(_selectedindex),
        ),*/

        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('Dashboard')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), title: Text('Earnings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('MyProfile')),
          ],
          currentIndex: _selectedindex,
          onTap: _onItemTapped,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 35.0),
              height: 50,
              width: 380,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Discover',
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    //alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: 210, top: 10.0),
                    child: Icon(
                      Icons.notifications_none,
                    ),
                  ),
                  Container(
                    //alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: 2, top: 10.0),
                    child: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              aspectRatio: 2,
              viewportFraction: 1.0,
              initialPage: 0,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: Duration(seconds: 2),
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                print(_currentIndex);
              },
              items: carouselSliderList(_getFoods()),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                _getFoods(),
                (index, url) {
                  return dots(_currentIndex, index);
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.only(left: 50.0),
                  height: 20.0,
                  width: 200.0,
                  child: Center(
                    child: Text(
                      'Paneer Pizza',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.only(left: 150.0),
                  //height: 20.0,
                  //width: 200.0,
                  child: Center(
                    child: Text(
                      'Rs 150',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor(index),
          ));
    } else {
      return Container(
          width: 30.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: dotColor(index)));
    }
  }

  Color dotColor(int index) {
    if (_currentIndex == index) {
      return _currentIndex == index ? Colors.red : Colors.grey;
    } else {
      return _currentIndex == index ? Color(0xFF675AE1) : Colors.black;
    }
  }

  List<FoodItem> _getFoods() {
    return [
      new FoodItem('assets/index.jpeg'),
      new FoodItem('assets/img1.jpeg'),
      new FoodItem('assets/img2.jpeg'),
      new FoodItem('assets/img3.jpeg'),
      new FoodItem('assets/img4.jpeg'),
      new FoodItem('assets/img5.jpeg'),

    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  carouselSliderList(List<FoodItem> getFoodsList) {
    return getFoodsList.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  Widget imageSliderItem(FoodItem i) {
    return Container(
      padding: EdgeInsets.only(left: 8,right: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            i.path,
            fit: BoxFit.cover,
          ),
        ));
  }
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}
