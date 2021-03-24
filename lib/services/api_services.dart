import 'dart:async' show Future, Timer;
import 'dart:io';
import 'dart:convert';
import 'package:try_http/model/carpark.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:try_http/model/carparkLocation.dart';

//const String FileName = 'carparkJsonFile.json';


class FileStorage{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    String fileName = 'carparkJsonFile.json';
    final path = await _localPath;
    return File('$path/$fileName');
  }

  void _writeJson(String jsonString) async{
    File _filePath = await _localFile;
    _filePath.writeAsString(jsonString);
  }


}

Future <List<CarparkData>> loadCarparkList() async {

  List<CarparkData> _carparkData = [];

  //final file = await
  var response = await http.get(Uri.encodeFull("https://api.data.gov.sg/v1/transport/carpark-availability"), headers: {"Accept": "application/json"});
  var json = await jsonDecode(response.body);
  APIInfo apiInfo = new APIInfo.fromJson(json);

  FileStorage fileStorage = new FileStorage();

  fileStorage._writeJson(json.toString());

  print(apiInfo.items[0].carparkData[5].carpark_number);
  //return apiInfo.items[0].carparkData.sublist(0, 1);
  //return apiInfo.items[0].carparkData[0].carpark_number;

  _carparkData.addAll(apiInfo.items[0].carparkData);
  print('hererererererererererererere');
  print(_carparkData.length);
  return _carparkData;
}

Future <List<CarparkInfo>> loadData() async {
  //List<CarparkData> _carparkData = [];

  List<CarparkInfo> _carparkInfo = [];

  //final file = await
  var response = await http.get(Uri.encodeFull("https://api.data.gov.sg/v1/transport/carpark-availability"), headers: {"Accept": "application/json"});
  var json = await jsonDecode(response.body);
  APIInfo apiInfo = new APIInfo.fromJson(json);

  FileStorage fileStorage = new FileStorage();

  fileStorage._writeJson(json.toString());

  print(apiInfo.items[0].carparkData[5].carpark_number);
  _carparkInfo.addAll(apiInfo.items[0].carparkData[0].carpark_info);
  return _carparkInfo;
  //return apiInfo.items[0].carparkData[5];
  //return apiInfo.items[0].carparkData[0].carpark_number;
}

Future <List<Records>> fetchData() async {
  List<Records> _recordsData = [];
  var response = await http.get(Uri.encodeFull("https://data.gov.sg/api/action/datastore_search?resource_id=139a3035-e624-4f56-b63f-89ae28d4ae4c"));
  var json = await jsonDecode(response.body);
  FirstEntry firstEntry = new FirstEntry.fromJson(json);

  print(firstEntry.result.records[0].carParkBasement);
  print(firstEntry.result.records.sublist(0, 2)[0]);
  print(firstEntry.result.records.sublist(0, 2)[1]);

  _recordsData.addAll(firstEntry.result.records);
  return _recordsData;
 //return firstEntry.result.records.sublist(0, 3);
}


