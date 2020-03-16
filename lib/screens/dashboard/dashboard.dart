import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
//import 'package:dio/dio.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  DashboardPageState(){
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text('Dashboard'),
    );
  }

  Widget _buildpage(){
    double width = MediaQuery.of(context).size.width;
    double box_width = (width - width * 3 / 20) / 2;
    return new Card(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: 30.0,
//                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("W", style: TextStyle(fontSize: 24)),
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
                      minWidth: 30.0,
//                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("M", style: TextStyle(fontSize: 24)),
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
                      minWidth: 30.0,
//                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("Q", style: TextStyle(fontSize: 24)),
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
                      minWidth: 30.0,
//                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("Y", style: TextStyle(fontSize: 24)),
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
                      minWidth: 30.0,
//                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("T", style: TextStyle(fontSize: 24)),
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
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: box_width,
                      height: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("kWH", style: TextStyle(fontSize: 24)),
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
                      minWidth: box_width,
                      height: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("£££", style: TextStyle(fontSize: 24)),
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
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: box_width,
                      height: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("CO2", style: TextStyle(fontSize: 24)),
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
                      minWidth: box_width,
                      height: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        child: Text("£££\nSaved", textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
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