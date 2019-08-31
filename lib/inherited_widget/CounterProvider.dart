
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/inherited_widget/MyCounter.dart';

class CounterProvider extends InheritedWidget{
 final MyCounter myCounter;
  final Widget child;

  CounterProvider({this.myCounter, this.child}):super(child:child);
  static CounterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return myCounter!=oldWidget.myCounter;
  }}