
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_project/utlits/http_reguest.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal , 
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text('EFE TEST'),
      ),
        body: Consumer<API>(
        builder: (context, value, child) {
          final _getDate = value.getCountryData() ;
          return FutureBuilder(
            future: _getDate ,
            builder: (context, AsyncSnapshot dataSnap) {
              final data = dataSnap.data;
      
              if (dataSnap.hasData) {
                return ListView.builder(
                    itemCount: dataSnap.data['data'].length,
                    itemBuilder: (context, index) {
                      
      
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                         
                          children: [
                          
                            Expanded(
                              flex: 2,
                              child:  SvgPicture.network( data["data"][index]["flag"]?? 'No Found flag', width: 150)),
                            Expanded(child: Text( data["data"][index]["name"] ?? 'No Found name'  , style: TextStyle(color: Colors.white))),
                            Expanded(
                              flex: 1,
                              child: Text(data["data"][index]["currency"] ?? 'No Found currency' , style: TextStyle(color: Colors.white),)) ,
                         
                            
                          ],
                        ),
                      ) ;
                   
                    });
              } else {
                // Circular Progress Indicator ()------------------------------------------
                return const Center(child: Text('Loading..' ,style: TextStyle(fontSize: 25 , color: Colors.white),) );
              }
            });
        },
      ),
    );
  }
}
