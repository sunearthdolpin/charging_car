import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
//import 'package:dio/dio.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool switchProfile = false;

  void _onSwitchChangedOfProfile(bool value) {
    switchProfile = value;
  }
  SettingsPageState(){
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text('Settings'),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Payment Method",
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
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      splashColor: Colors.blueAccent,
                      child: Text("Token ID", style: TextStyle(fontSize: 24)),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.blue)
                      ),
                    ),
                  )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("Credit Card", style: TextStyle(fontSize: 24)),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.blue)
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("Select Charge Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 20))
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                            onChanged: _onSwitchChangedOfProfile,
                            value: switchProfile,
                          ),
                        ),
                      ],
                    )
                ),
              ],

            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: new Text("Charge Start",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text("00:30",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18))
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
                            child: new Text("Charge End",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text("04:30",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18))
                        ),

                      ],
                    )
                ),
              ],

            ),
          ),
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