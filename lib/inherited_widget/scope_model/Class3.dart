import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/inherited_widget/CounterProvider.dart';
import 'package:flutter_bloc_patteren/inherited_widget/MyCounter.dart';
class Class3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCounter myCounter=CounterProvider.of(context).myCounter;
    return Container(
      child: new Text('${myCounter.count}'),
    );
  }
}
