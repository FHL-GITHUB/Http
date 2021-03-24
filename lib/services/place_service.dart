import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:try_http/model/place_search.dart';

class PlacesService {
  final key = 'AIzaSyDV_QAOWu3eCEdDPUhfBdDqK8lKZR5N_uk';
  List<PlaceSearch> searchResults;

  Future<List<PlaceSearch>> getAutoComplete(String search) async{
    var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  searchPlace(String searchTerm) async{
    searchResults = await getAutoComplete(searchTerm);
  }


/*Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String,dynamic>;
    return Place.fromJson(jsonResult);
  }*/

  Future<List<Place>> getPlaces(double lat, double lng,String placeType) async {
    var url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

}