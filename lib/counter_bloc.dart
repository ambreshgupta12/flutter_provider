
import 'dart:async';

import 'package:flutter_bloc_patteren/counter_event.dart';

class CounterBloc{
  int _counter=0;
 final   counterStateController=new StreamController<int>();

  StreamSink<int> get  _inCounter =>counterStateController.sink;
  Stream<int> get counterStream=>counterStateController.stream;


final counterEventController=new StreamController<CounterEvent>();
Sink<CounterEvent> get  counterEventSink=>counterEventController.sink;

  CounterBloc() {
    counterEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(CounterEvent event)
  {
    if(event is IncrementEvent)
      {
        _counter++;
      }
      else{
        _counter--;
    }
    _inCounter.add(_counter);

  }

void dispose(){
  counterStateController.close();
  counterEventController.close();
}



}

