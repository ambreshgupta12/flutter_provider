import 'package:flutter/material.dart';
class InheritedWidgets  extends StatefulWidget {
  @override
  _InheritedWidgets  createState() => _InheritedWidgets();
}

class _InheritedWidgets extends State<InheritedWidgets > {
  var myCounter=MyCounter(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Class1(),
            Class2(myCounter),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        setState(() {
          myCounter.increment();
        });
      },
      child: Icon(Icons.add),
        tooltip:"Increment",

      ),
    );
  }
}


class Class1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Class 1"),
    );
  }
}


class MyCounter{
  int counter;
  MyCounter(this.counter);
  void increment() {
    counter++;
  }

}



class Class2 extends StatelessWidget {
  MyCounter myCounter;
  Class2(this.myCounter);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
         new Text('Class 2'),

          Class3(myCounter),

        ],
      ),
    );
  }


}
class Class3 extends StatelessWidget {
  MyCounter myCounter;
  Class3(this.myCounter);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text('Class 3 :${myCounter.counter} '),
    );
  }
}
