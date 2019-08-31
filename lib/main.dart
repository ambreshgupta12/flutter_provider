import 'package:flutter/gestures.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_patteren/counter_bloc.dart';
import 'package:flutter_bloc_patteren/counter_event.dart';
import 'package:flutter_bloc_patteren/simple_provider/ProviderExample.dart';
import 'package:provider/provider.dart';

import 'list_counter_provider/cart_item_provider.dart';
import 'list_counter_provider/cart_screen.dart';
import 'simple_provider/AppProvider.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CartScreen(),
      ),
      providers: [
        ChangeNotifierProvider<CartItemProvider>(
          builder: (_) => CartItemProvider(),
          child: CartScreen(),
        ),ChangeNotifierProvider<AppProvider>(
          builder: (_) => AppProvider(),
          child: ProviderExample(),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = new CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                );
              })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () => counterBloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          new FloatingActionButton(
            onPressed: () => counterBloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Minutes',
            child: Icon(Icons.remove),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }
}

class NoticationList extends StatefulWidget {
  @override
  _NoticationListState createState() => _NoticationListState();
}

class _NoticationListState extends State<NoticationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Notifications'),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, index) {
            return _buildItemCard();
          }),
    );
  }

  Widget _buildItemCard() {
    return Card(
        elevation: 2.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: new GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                //color: Color.fromRGBO(64, 75, 96, .9),
                ),
            child: _buildListTile(),
          ),
        ));
  }

  Widget _buildListTile() {
    // var newDateTimeObj = new DateFormat("yyyy-MM-dd HH:mm:ss").parse('12-03-2018');
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage('assets/noti.png'),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        'Notication Title',
        style: TextStyle(
          color: Colors.blueAccent,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.0),
        child: Column(
          children: <Widget>[
            Container(
              child: new Row(
                children: <Widget>[
                  //Icon(Icons.linear_scale, color: Colors.yellowAccent,),

                  Container(
                    padding: EdgeInsets.only(right: 8.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                        right: new BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: Text(
                      //formatDate(newDateTimeObj, [dd, " ", MM, ',', yyyy]),
                      '12-09-2109',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 8.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                          //right: new BorderSide(width: 1.0, color: Colors.white24),
                          ),
                    ),
                    child: Text(
                      //formatDate(newDateTimeObj, [HH, ':', nn, ' ', am]),
                      '13-09-2109',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8.0),
              child: new Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'DOOOOOOOOOOO',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' Guests',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 8.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                            //right: new BorderSide(width: 1.0, color: Colors.white24),
                            ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'DDDDDDDDDD',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      /*trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.black,
        size: 30.0,
      ),*/
    );
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  static const String routeName = '/material/text-form-field';

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? 'show password' : 'hide password',
          ),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PersonData person = PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  bool _autovalidate = false;
  bool _formWasEdited = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      showInSnackBar('${person.name}\'s phone number is ${person.phoneNumber}');
    }
  }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validatePhoneNumber(String value) {
    _formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(###) ###-#### - Enter a US phone number.';
    return null;
  }

  String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Please enter a password.';
    if (passwordField.value != value) return 'The passwords don\'t match';
    return null;
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('This form has errors'),
              content: const Text('Really leave this form?'),
              actions: <Widget>[
                FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Text fields'),
        // actions: <Widget>[MaterialDemoDocumentationButton(TextFormFieldDemo.routeName)],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidate: _autovalidate,
          onWillPop: _warnUserAboutInvalidData,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'Name *',
                    ),
                    onSaved: (String value) {
                      person.name = value;
                    },
                    validator: _validateName,
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.phone),
                      hintText: 'Where can we reach you?',
                      labelText: 'Phone Number *',
                      prefixText: '+1',
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (String value) {
                      person.phoneNumber = value;
                    },
                    validator: _validatePhoneNumber,
                    // TextInputFormatters are applied in sequence.
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                      // Fit the validating format.
                      _phoneNumberFormatter,
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.email),
                      hintText: 'Your email address',
                      labelText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      person.email = value;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText:
                          'Tell us about yourself (e.g., write down what you do or what hobbies you have)',
                      helperText: 'Keep it short, this is just a demo.',
                      labelText: 'Life story',
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Salary',
                      prefixText: '\$',
                      suffixText: 'USD',
                      suffixStyle: TextStyle(color: Colors.green),
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 24.0),
                  PasswordField(
                    fieldKey: _passwordFieldKey,
                    helperText: 'No more than 8 characters.',
                    labelText: 'Password *',
                    onFieldSubmitted: (String value) {
                      setState(() {
                        person.password = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    enabled:
                        person.password != null && person.password.isNotEmpty,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      labelText: 'Re-type password',
                    ),
                    maxLength: 8,
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: RaisedButton(
                      child: const Text('SUBMIT'),
                      onPressed: _handleSubmitted,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    '* indicates required field',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##...
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
