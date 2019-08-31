import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/inherited_widget/Class3.dart';

class Class2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Class 2"),
          Class3(),
        ],
      )
    );
  }
}
