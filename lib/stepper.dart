import 'package:flutter/material.dart';

class StepperFlutter extends StatefulWidget {



  @override
  _StepperFlutterState createState() => _StepperFlutterState();
}

class _StepperFlutterState extends State<StepperFlutter>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListView(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 20.0),
              child: new MyTimeLine(),
            ),
            new MyTimeLine(),
            new MyTimeLine(),
            new MyTimeLine(),
            new MyTimeLine(),
            new MyTimeLine(),
            new MyTimeLine(),
          ],
      ),
    );
  }
}

class MyTimeLine extends StatefulWidget {
  @override
  _MyTimeLineState createState() => _MyTimeLineState();
}

class _MyTimeLineState extends State<MyTimeLine> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Stack(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(left: 0.0),
                      child: new VerticalSeparator(),
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          child: new Text(
                            '07:23',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                        ),
                        new Row(
                          children: <Widget>[
                            new Icon(Icons.directions_bus),
                            new SizedBox(
                              width: 5,
                            ),
                            new Container(
                              height: 24,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text('UP 12 T-4423',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                        'Header Text',
                        style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange,
                            fontSize: 16.0
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 20.0, top: 5.0),
                      child: new Text(
                          'Lorem ipsum description here description here Lorem ipsum description here description here Lorem ipsum description here '
                      ),
                    )
                  ],
                ),
              )
            ],

          )
        ],
      ),
    );
  }
}

class VerticalSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: 56, left: 20),
          height: 80.0,
          width: 2.0,
          color: Colors.deepOrange,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: new Container(
            child: Icon(Icons.radio_button_unchecked),
          ),
        ),
        new Padding(padding: EdgeInsets.only(top: 12))
      ],
    );
  }
}
