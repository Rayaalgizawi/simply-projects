import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

// used provider state management
class API extends ChangeNotifier{

//
  getCountryData () async{

    const _apiUrl = 'https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode';
    final data =await https.get(Uri.parse(_apiUrl)) ;

    if(data.statusCode == 200 ){
      var allDataBody = json.decode(data.body);
      return await allDataBody;

    }else {
      // Error 
      return print('connection Error please Fix ') ;
    }

  }
}