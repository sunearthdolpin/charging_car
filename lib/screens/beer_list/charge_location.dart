import 'dart:convert';

import 'package:chargecar/models/charge_point.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:chargecar/models/place_model.dart';

class ChargeLocation extends StatefulWidget {
  final ChargePoint chargepoint;
  ChargeLocation({Key key, @required this.chargepoint}) : super(key: key);

  @override
  ChargeLocationState createState() => ChargeLocationState(chargepoint);
}

class ChargeLocationState extends State<ChargeLocation> {
  ChargePoint chargepoint;
  bool switchToken = false;
  bool switchCredit = false;

  void _onSwitchChangedOfToken(bool value) {
    switchToken = value;
  }

  void _onSwitchChangedOfCredit(bool value) {
    switchCredit = value;
  }
  ChargeLocationState(ChargePoint point){
    chargepoint = point;
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text('Charge Point ' + chargepoint.longitude + "," + chargepoint.langtude),
    );
  }

  Widget _buildpage(){
    return new Card(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Available for charging",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 24))
                ),
              ],
            ),

          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("7kW    GBP 0.30",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 24))
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("          per kWh",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16))
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Select Payment Method",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18))
                ),
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("Token ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Switch(
                              onChanged: _onSwitchChangedOfToken,
                              value: switchToken,
                            ),
                        ),

                      ],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("Credit Card",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Switch(
                              onChanged: _onSwitchChangedOfCredit,
                              value: switchCredit,
                            ),
                        ),

                      ],
                    )
                ),
              ],

            ),
          ),
          Expanded(
            flex: 1,
            child: ButtonTheme(
              minWidth: double.infinity,
//              height: 80.0,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                splashColor: Colors.blueAccent,
                child: Text("Start Charging", style: TextStyle(fontSize: 18)),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
//                    side: BorderSide(color: Colors.red)
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildpage(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}