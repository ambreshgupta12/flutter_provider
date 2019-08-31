import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item_provider.dart';




class SingleCartItem extends StatelessWidget {

  double width;
  double height;
  int index;


  SingleCartItem(this.index);

  @override
  Widget build(BuildContext context) {
    final cartItemProvider =Provider.of<CartItemProvider>(context);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      //cartItemProvider.isChecked=!cartItemProvider.isChecked;
                      cartItemProvider.cartItemList[index].isCheckeds(!cartItemProvider.cartItemList[index].isChecked);
                    },
                    child: cartItemProvider.cartItemList[index].isChecked?Image.asset(
                      "assets/cart_item_selected.png",
                      width: 20,
                      height: 20,
                    ):Image.asset(
                      "assets/cart_item_unselected.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Image.asset(
                    "assets/daily_hourly_kurties_for_jeans.png",
                    width: 100,
                    height: 80,

                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(child: Text('Kurties for jeans',style: TextStyle(color: Colors.black,fontSize: 18,),maxLines: 2,overflow: TextOverflow.ellipsis,),

                        width: width/3.3,
                      ),
                      SizedBox(height: 6,),
                      Text('\$19.80',style: TextStyle(color: Colors.black,fontSize: 16),),
                    ],
                  )


                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(

                    children: <Widget>[
                      new Container(
                        width: 24,
                        height: 24,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff7f8fa),
                            border: Border.all(
                                color: Color(0xffdddddd), width: 0.5)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.black54,
                        ),
                      ),


                      SizedBox(width: 10,),

                      Text('1',style: TextStyle(fontSize: 16,color: Colors.black),),
                      SizedBox(width: 10,),
                      new Container(
                        width: 24,
                        height: 24,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff7f8fa),
                            border: Border.all(
                                color: Color(0xffdddddd), width: 0.5)),
                        child: Icon(
                          Icons.add,
                          color: Colors.black54,
                        ),
                      ),

                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

