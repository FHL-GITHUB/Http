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

  //int i=1;
  const oneSec = const Duration(seconds: 300);
  new Timer.periodic(oneSec,(Timer t) async{
    _total_lots.clear();
    _av_lots.clear();
    _carparks.clear();
    _carparkID.clear();
    //print('byebye byebye byebye byebye byebye byebye');
    //print(_total_lots.length);
    //i += 1;
    final List<CarparkData> carparks = await loadCarparkList();
    _carparks.addAll(carparks);
    for(int i=0;i<_carparks.length;i++){
      _total_lots.add(_carparks[i].carpark_info[0].total_lots);
      _av_lots.add(_carparks[i].carpark_info[0].lots_available);
      _carparkID.add(_carparks[i].carpark_number);
    }
    print('hellllllllloooooooooooooooooooooooo');

    print(_carparkID.length);
    print(_av_lots.length);
    //print('Value of i:'+i.toString());
    print(_av_lots[0]+'\t'+_av_lots[2]);
  });
}

class SearchApp extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: Home(),
        ),
      );
    }
  }
  /*Widget build(BuildContext context) => MaterialApp(
    title: 'Carpark List App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black
    ),
    home: Home(),
  );*/

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List<CarparkData> _carparks = <CarparkData>[];
  TextEditingController editingController = TextEditingController();


  /*@override
  void initState() {
    super.initState();
    listenForRecords();

  }*/


  /*
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Carpark List'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {

                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Enter address or Carpark name",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:  _carparks.length,
                itemBuilder: (context, index) => CarparkTile(_carparks[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async {
                // show input autocomplete with selected mode
                // then get the Prediction selected
                Prediction p = await PlacesAutocomplete.show(
                    context: context, apiKey: kGoogleApiKey);
                displayPrediction(p);
              },
              child: Text('Find address'),

            )
        )
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
    }
  }

  void listenForRecords() async {
    final List<CarparkData> carparks = await loadCarparkList();
    setState(() {
      _carparks.addAll(carparks);
    });
  }
}


/*
class CarparkTile extends StatelessWidget {
  final CarparkData _carpark;
  CarparkTile(this._carpark);


  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text('Carpark Number: '+_carpark.carpark_number),
        subtitle: Text('Lots available: '+_carpark.carpark_info[0].lots_available
            +'\nTotal Lots: '+_carpark.carpark_info[0].total_lots),
      ),
      Divider()
    ],
  );
}*/