import 'dart:async';

import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:try_http/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:try_http/model/carparkLocation.dart';
import 'package:try_http/model/carpark.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';


const kGoogleApiKey = "AIzaSyDV_QAOWu3eCEdDPUhfBdDqK8lKZR5N_uk";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);


void carparkList() async{
  List<CarparkData> _carparks = <CarparkData>[];
  List<String> _total_lots = <String>[];
  List<String> _av_lots = <String>[];
  List<String> _carparkID = <String>[];


  const oneSec = const Duration(seconds: 300);
  new Timer.periodic(oneSec,(Timer t) async{
    _total_lots.clear();
    _av_lots.clear();
    _carparks.clear();
    _carparkID.clear();

    final List<CarparkData> carparks = await loadCarparkList();
    _carparks.addAll(carparks);
    for(int i=0;i<_carparks.length;i++){
      _total_lots.add(_carparks[i].carpark_info[0].total_lots);
      _av_lots.add(_carparks[i].carpark_info[0].lots_available);
      _carparkID.add(_carparks[i].carpark_number);
    }

    //print(_carparkID.length);
    //print(_av_lots.length);
    //print(_av_lots[0]+'\t'+_av_lots[2]);
  });
}

class SearchApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Carpark List',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Carpark'),
        ),
        body: new Center(
          child: new Text('Hello Carpark'),
        ),
      ),
    );
  }
 }
