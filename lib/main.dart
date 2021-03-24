//import 'dart:html';

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:try_http/model/carparkLocation.dart';
import 'package:try_http/services/api_services.dart';
import 'package:try_http/model/carpark.dart';
import 'package:flutter/material.dart';
import 'package:try_http/page/SearchPage.dart';
//import 'package:try_http/page/search_page.dart.dart';

void main(){
  loadCarparkList();
  carparkList();
  runApp(SearchApp());
  //loadData();
  //fetchData();

}


/*
class MyApp extends StatelessWidget {
  List<Records> records = <Records>[];
  //final Future<List<Records>> records;

  MyApp({this.records});
  void initState(){
    print('hereeeeeeeeeeeeeeeeeeee1234512345');
    addRecords();
  }

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Top Beers'),
    ),
    body: ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) => (BeerTile(records[index])),
    ),
  );

  void addRecords() async{
    final List<Records> futureRecord = await fetchData();
    setState(){
      records.addAll(futureRecord);
    }

  }
}

class BeerTile extends StatelessWidget {
  final Records _record;
  BeerTile(this._record);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_record.address),
        subtitle: Text(_record.carParkType),
      ),
      Divider()
    ],
  );
}*/