import 'package:flutter/material.dart';
import 'package:flutter_bloc_patteren/simple_provider/AppProvider.dart';
import 'package:provider/provider.dart';


class ProviderExample extends StatefulWidget {
  @override
  _ProviderExampleState createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          DisplayText(),
          ChangeData(),
        ],
      ),
    );
  }
}


class DisplayText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text("Enter the Text :",style: TextStyle(fontSize: 14),),
            ),
          ),
          Expanded(

            flex: 3,
            child: Container(child: Text(textProvider.getDisplayText,style: TextStyle(fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }
}

class ChangeData extends StatelessWidget {

 final _textFieldForm =new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final appProvider=Provider.of<AppProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
         obscureText: true,
          onSaved: (value){
           appProvider.setDisplayText(value);
          },
          onFieldSubmitted: (value){
            print('afs');
            appProvider.setDisplayText(value);

          },
          showCursor: true,
          cursorColor: Colors.red,
          controller: _textFieldForm,
          decoration: InputDecoration(
            labelText: 'Enter Text',
            border: OutlineInputBorder(),





          ),
        ),
      )
    );
  }
}

