import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/custom_widget/RaisedGradientButton.dart';
import 'package:flutter_bloc_patteren/list_counter_provider/cart_item_provider.dart';
import 'package:flutter_bloc_patteren/list_counter_provider/single_cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double width;

  double height;
  

  @override
  Widget build(BuildContext context) {

   final cartItemProvider =Provider.of<CartItemProvider>(context);

    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Center(
          child: Text(
            'Edit',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Align(
            child: wishListIcon(),
            alignment: Alignment.centerRight,
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Align(
              alignment: Alignment.center,
              child: Badge(
                badgeColor: Color(0xffe60023),
                badgeContent: Text(
                  '.',
                  style: TextStyle(color: Colors.red, fontSize: 1),
                ),
                position: BadgePosition(top: -2, left: 12, bottom: 17),
                child: Image.asset('assets/cart_notification.png',
                    width: 20, height: 20),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Container(
                alignment: Alignment.centerLeft,
                width: width,
                height: 28,
                decoration: new BoxDecoration(
                    color: Color(0xfff2969f).withOpacity(0.32),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "2 coupons are available",
                        style: TextStyle(
                          fontFamily: 'CircularStdBook',
                          color: Color(0xfff2969f),
                          fontSize: 14,
                        ),
                      ),
                      Image.asset(
                        "assets/cart_coupons_right_arrow.png",
                        width: 20,
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: new Text("Free Sea Shipping Items",
                  style: TextStyle(
                    fontFamily: 'CircularStdBook',
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            ...List.generate(cartItemProvider.cartItemList.length, (index){
              return SingleCartItem(index);

            })
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/cart_item_unselected.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Select All",
                        style: TextStyle(
                          fontFamily: 'CircularStdBook',
                          color: Colors.black,
                          fontSize: 13,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    new Text("\$0.80",
                        style: TextStyle(
                          fontFamily: 'Apercu-Medium',
                          color: Color(0xffff0027),
                          fontSize: 16,
                        ))
                  ],
                ),


              ],
            ),
            RaisedGradientButton(
            text: 'Buy',
            width: 110,
              height: 32,
            ),





          ],
        ),
      ),
    );

  }

  Widget wishListIcon() {
    return Badge(
      badgeColor: Color(0xffff243a),
      badgeContent: Text(
        '2',
        style: TextStyle(
            color: Colors.white, fontSize: 10, fontFamily: 'CircularStdBook'),
      ),
      child: Image.asset('assets/cart_heart.png', width: 20, height: 20),
    );
  }
}
