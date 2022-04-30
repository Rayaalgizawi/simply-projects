
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_project/screen/currency.dart';
import 'package:simple_project/utlits/http_reguest.dart';

void main() {
  // provider scope
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> API() ,
      child: const MaterialApp(
        home: Currency(),
      ),
    );
  }
}
