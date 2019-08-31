import 'dart:math';
import 'package:flutter_bloc_patteren/inherited_widget/Class1.dart';
import 'package:flutter_bloc_patteren/inherited_widget/Class2.dart';
import 'package:flutter_bloc_patteren/inherited_widget/CounterProvider.dart';
import 'package:flutter_bloc_patteren/inherited_widget/MyCounter.dart';
import 'package:random_pk/random_pk.dart';

import 'package:flutter/material.dart';
class InheritedWidgets extends StatefulWidget {
  @override
  _InheritedWidgetsState createState() => _InheritedWidgetsState();
}

class _InheritedWidgetsState extends State<InheritedWidgets> {
  var myCounter=MyCounter(0);


  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      myCounter: myCounter,
      child: Scaffold(
        appBar: AppBar(
          title: new Text("Inherited Widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Class1(),
              Class2(),
              Padding(padding: EdgeInsets.only(top: 10)),
              RandomContainer(
                changeOnRedraw: true,
                height: 100,
                width: 100,

              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){

          setState(() {


            myCounter.increment();
          });
        },
        ),
      ),
    );
  }
}
