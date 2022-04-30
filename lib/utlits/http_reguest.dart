import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';


class API extends ChangeNotifier{

// create method get api used json 
  getCountryData () async{

    const _apiUrl = 'https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode';
    final data =await https.get(Uri.parse(_apiUrl)) ;

    // check all connections
    if(data.statusCode == 200 ){
      // decode data 
      var allDataBody = json.decode(data.body);
      return await allDataBody;

    }else {
      // if Error print msg 
      return print('connection Error please Fix ') ;
    }

  }
}
