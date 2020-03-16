import 'package:http/http.dart' as http;
import '../models/place_model.dart';
import 'dart:async';
import 'dart:convert';

class LocationService {
  static final _locationService = new LocationService();

  static LocationService get() {
    return _locationService;
  }

  final String detailUrl =
      "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyAHZJ78Pc2L5A__5AAtyEzxXxDpU8K34_E&placeid=";
  final String url =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=33.889339,35.476214&radius=1500&key=AIzaSyAHZJ78Pc2L5A__5AAtyEzxXxDpU8K34_E";

  Future<List<PlaceDetail>> getNearbyPlaces() async {
    var reponse = await http.get(url, headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    var places = <PlaceDetail>[];
    data.forEach((f) => places.add(new PlaceDetail(f["place_id"], f["name"],
        f["icon"], f["rating"].toString(), f["vicinity"])));

    return places;
  }

  Future getPlace(String place_id) async {
    var response = await http
        .get(detailUrl + place_id, headers: {"Accept": "application/json"});
    var result = json.decode(response.body)["result"];
   

    List<String> weekdays = [];
//    if (result["opening_hours"] != null)
//      weekdays = result["opening_hours"]["weekday_text"];
    return new PlaceDetail(
        result["place_id"],
        result["name"],
        result["icon"],
        result["rating"].toString(),
        result["vicinity"],
        result["formatted_address"],
        result["international_phone_number"],
        weekdays);
  }
//reviews.map((f)=> new Review.fromMap(f)).toList()
}
