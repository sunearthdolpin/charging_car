import 'dart:convert';

import 'package:chargecar/services/gplace_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:chargecar/models/charge_point.dart';
import 'package:chargecar/screens/beer_list/charge_location.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:location/location.dart' as LocationManager;



class BeerListPage extends StatefulWidget {
  BeerListPage({Key key}) : super(key: key);

  @override
  BeerListPageState createState() => BeerListPageState();
}

class BeerListPageState extends State<BeerListPage> {
  final TextEditingController _filter = new TextEditingController();
//  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Home' );

  static String kGoogleApiKey = 'AIzaSyAHZJ78Pc2L5A__5AAtyEzxXxDpU8K34_E';
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  BeerListPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),

      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {
    if(names.isEmpty){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      if (!(_searchText.isEmpty)) {
        List tempList = new List();
        for (int i = 0; i < filteredNames.length; i++) {
          if(filteredNames[i].vicinity == null) continue;
          if (filteredNames[i].vicinity.toLowerCase().contains(_searchText.toLowerCase())) {
            tempList.add(filteredNames[i]);
          }
        }
        filteredNames = tempList;
      }
      return ListView.builder(
        itemCount: names == null ? 0 : filteredNames.length,

        itemBuilder: (BuildContext context, int index) {
          var address = "";
          if(filteredNames[index].vicinity != null) address = filteredNames[index].vicinity;
          return new GestureDetector(
            onTap: ()=> {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChargeLocation(chargepoint: filteredNames[index])),
              )
            },
            child: new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text("Location: " + filteredNames[index].longitude + "," + filteredNames[index].langtude,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text("Address: " + address,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14))
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text("Distance             Connectors Available",// + beer['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16))
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void onClickItem(int index){

  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Charge Points' );
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  void refresh() async {
    final center = await getUserLocation();
    getNearbyPlaces(center);
  }

  Future<LatLng> getUserLocation() async {
    LocationManager.LocationData currentLocation = null;
    final location = LocationManager.Location();
    try {
      currentLocation = (await location.getLocation());
      final lat = currentLocation.longitude;
    final lng = currentLocation.latitude;
//    final center = LatLng(lat, lng);
    final center = LatLng(51.509660, -0.221472);
    return center;
    } on Exception {
    currentLocation = null;
    return null;
    }
  }

  void _getNames() async {
//    final response = await dio.get('https://swapi.co/api/people');
    refresh();
//    List<PlacesSearchResult> places = [];
//    String jsonString = await _loadAStudentAsset();
//    final jsonResponse = json.decode(jsonString);
//    List tempList = new List();
//    for (int i = 0; i < jsonResponse.length; i++) {
//      tempList.add(new ChargePoint(jsonResponse[i]['location'], jsonResponse[i]['address'], '', jsonResponse[i]['charge_point_id']));
//    }
//    setState(() {
//      names = tempList;
//      names.shuffle();
//      filteredNames = names;
//    });

  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/beers.json');
  }

  void getNearbyPlaces(LatLng center)  async {
    final location = Location(center.latitude, center.longitude);
    final result = await _places.searchNearbyWithRadius(location, 2500);

    if (result.status == 'OK') {
      this.setState(() {
        names.clear();
        filteredNames.clear();
        result.results.forEach((f) {
          ChargePoint temp = new ChargePoint(f.vicinity, f.geometry.location.lng.toStringAsFixed(2), f.geometry.location.lat.toStringAsFixed(2));
          names.add(temp);
          filteredNames.add(temp);
        });
      });
//      for(int i=0; i<result.results.length; i++){
//        LocationService.get().getPlace(result.results[i].id).then((data){
//          this.setState(() {
//            names.add(data);
//            filteredNames.add(data);
//          });
//        });
//      }
    } else {
      print(result.errorMessage);
    }

  }


}