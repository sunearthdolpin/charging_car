import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:location/location.dart' as LocationManager;
import '../../models/place_model.dart';
import '../../services/gplace_service.dart';

class BeerListPage extends StatefulWidget {
  BeerListPage({Key key}) : super(key: key);

  @override
  BeerListPageState createState() => BeerListPageState();
}

class BeerListPageState extends State<BeerListPage> {
  final TextEditingController _filter = new TextEditingController();
//  final dio = new Dio();
  String _searchText = "";
  List<PlaceDetail> names;
  List<PlaceDetail> filteredNames;
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Home' );


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
    if(names == null){
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      if (!(_searchText.isEmpty)) {
        List tempList = new List();
        for (int i = 0; i < filteredNames.length; i++) {
          if (filteredNames[i].name.toLowerCase().contains(_searchText.toLowerCase())) {
            tempList.add(filteredNames[i]);
          }
        }
        filteredNames = tempList;
      }
      return ListView.builder(
        itemCount: names == null ? 0 : filteredNames.length,

        itemBuilder: (BuildContext context, int index) {
          String address = "Loading...";
          if(filteredNames[index].formatted_address != null){
            address = filteredNames[index].formatted_address;
          }
            return new GestureDetector(
              onTap: ()=> {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ChargeLocation(chargepoint: filteredNames[index])),
//              )
              },
              child: new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text("Location: " + filteredNames[index].name,
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


//  Future<LatLng> getUserLocation() async {
//    LocationManager.LocationData currentLocation = null;
//    final location = LocationManager.Location();
//    try {
//      currentLocation = (await location.getLocation());
//      final lat = currentLocation.longitude;
//      final lng = currentLocation.latitude;
////    final center = LatLng(lat, lng);
//      final center = LatLng(51.509660, -0.221472);
//      return center;
//    } on Exception {
//      currentLocation = null;
//      return null;
//    }
//  }

  void _getAllInfos(){
//    int index = 0;
//    while(true){
//      if(index == names.length) break;
//      print(names[index].id);
//      LocationService.get().getPlace(names[index].id).then((data){
//        names[index] = data;
//        filteredNames[index++] = data;
//      });
//    }

  }

  void _getNames() async {
//    final response = await dio.get('https://swapi.co/api/people');
    if (names == null) {
      LocationService.get().getNearbyPlaces().then((data) {
        var temp = data;
        LocationService.get().getPlace(data[3].id).then((_data){
          this.setState(() {
            temp[0] = _data;
            names = temp;
            filteredNames = names;
//          _getAllInfos();
          });
        });
      });
    }
  }
}