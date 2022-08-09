// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stateful App Example',
//       home: FavoriteCity(),
//     );
//   }
// }
//
// class FavoriteCity extends StatefulWidget {
//   const FavoriteCity({Key? key}) : super(key: key);
//
//   @override
//   State<FavoriteCity> createState() => _FavoriteCityState();
// }
//
// class _FavoriteCityState extends State<FavoriteCity> {
//   String name = "";
//   var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
//   String _currentItemSelected = 'Rupees';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stateful App Example'),
//       ),
//       body: Container(
//           margin: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               TextField(
//                 onSubmitted: (String userInput) {
//                   setState(() {
//                     name = userInput;
//                   });
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: DropdownButton<String>(
//                   items: _currencies.map((String dropDownListItem) {
//                     return DropdownMenuItem<String>(
//                       value: dropDownListItem,
//                       child: Text(dropDownListItem),
//                     );
//                   }).toList(),
//
//                   onChanged:(String? newValueSelected) {
//                     _ondropDownItemSelected((newValueSelected!));
//
//                   },
//                   value: _currentItemSelected,
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: Text(
//                   'Your best city is ${name}',
//                   style: TextStyle(
//                     //fontStyle: FontStyle.italic,
//                     fontFamily: 'Raleway',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 30.0,
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
//   void _ondropDownItemSelected(String newValueSelected){
//     setState(() {
//       this._currentItemSelected = newValueSelected;
//     });
//   }
// }