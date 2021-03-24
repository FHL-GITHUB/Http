import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:try_http/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:try_http/model/carparkLocation.dart';
import 'package:try_http/model/carpark.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:try_http/services/place_service.dart';
import 'package:provider/provider.dart';


const kGoogleApiKey = "AIzaSyDV_QAOWu3eCEdDPUhfBdDqK8lKZR5N_uk";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class SearchAppApp extends StatelessWidget {

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
  PlacesService _placesService = PlacesService();


  @override
  Widget build(BuildContext context) {
    final pageServiceClass = Provider.of<PlacesService>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Carpark List'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => pageServiceClass.searchPlace(value),
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Enter address or Carpark name",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
