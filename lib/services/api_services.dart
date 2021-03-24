import 'dart:async' show Future, Timer;
import 'dart:io';
import 'dart:convert';
import 'package:try_http/model/carpark.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:try_http/model/carparkLocation.dart';


Future <List<CarparkData>> loadCarparkList() async {

  List<CarparkData> _carparkData = [];

  var response = await http.get(Uri.encodeFull("https://api.data.gov.sg/v1/transport/carpark-availability"), headers: {"Accept": "application/json"});
  var json = await jsonDecode(response.body);
  APIInfo apiInfo = new APIInfo.fromJson(json);


  _carparkData.addAll(apiInfo.items[0].carparkData);

  return _carparkData;
}

Future <List<CarparkInfo>> loadData() async {

  List<CarparkInfo> _carparkInfo = [];
  var response = await http.get(Uri.encodeFull("https://api.data.gov.sg/v1/transport/carpark-availability"), headers: {"Accept": "application/json"});
  var json = await jsonDecode(response.body);
  APIInfo apiInfo = new APIInfo.fromJson(json);

  _carparkInfo.addAll(apiInfo.items[0].carparkData[0].carpark_info);
  return _carparkInfo;
}


