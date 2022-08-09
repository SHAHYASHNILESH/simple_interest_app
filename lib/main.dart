import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest Calculator App',
      debugShowCheckedModeBanner: false,
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
    );
  }
}

class SIForm extends StatefulWidget {
  const SIForm({Key? key}) : super(key: key);

  @override
  State<SIForm> createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  String _currentItemSelected = '';
  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
          backgroundColor: Colors.indigo,
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                      child: Image.asset(
                    'images/si.jpg',
                    width: 200.0,
                    height: 200.0,
                  )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: principalController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter principal amount';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Principal Amount',
                        hintText: 'Enter the principal amount',
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: roiController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter the rate of interest';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'Enter the rate of Interest',
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: termController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter the term';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Enter the number of years',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 25.0,
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            items: _currencies.map((String dropDownListItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownListItem,
                                child: Text(dropDownListItem),
                              );
                            }).toList(),
                            onChanged: (String? newValueSelected) {
                              _ondropDownItemSelected((newValueSelected!));
                            },
                            value: _currentItemSelected,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                              elevation: 7.0,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    this.displayResult =
                                        _calculateTotalReturns();
                                  }
                                });
                              },
                              color: Colors.deepPurpleAccent,
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        Container(
                          width: 15.0,
                        ),
                        Expanded(
                          child: RaisedButton(
                              elevation: 7.0,
                              onPressed: () {
                                setState(() {
                                  _reset();
                                });
                              },
                              color: Colors.black,
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(this.displayResult, style: textStyle),
                  )
                ],
              ),
            )));
  }

  void _ondropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        'After ${term} years, your investment will be worth ${totalAmountPayable} ${_currentItemSelected}';
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
