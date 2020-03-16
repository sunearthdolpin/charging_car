import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
//import 'package:dio/dio.dart';

class HistoryListPage extends StatefulWidget {
  HistoryListPage({Key key}) : super(key: key);

  @override
  HistoryListPageState createState() => HistoryListPageState();
}

class HistoryListPageState extends State<HistoryListPage> {
  Widget _appBarTitle = new Text( 'History' );

  HistoryListPageState() {
  }

  @override
  void initState() {
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
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: 5,

      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Date & Time",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 24))
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Location Cost kWh",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 24))
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Token ID Duration",// + beer['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 24))
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}