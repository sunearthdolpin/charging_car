import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:chargecar/screens/beer_list/beer_list.dart';
import 'package:chargecar/screens/beer_list/beer_list_backup.dart';
import 'package:chargecar/screens/history/history_list.dart';
import 'package:chargecar/screens/settings/settings.dart';
import 'package:chargecar/screens/dashboard/dashboard.dart';
//import 'package:chargecar/screens/beer_list/places_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final wdgetTitles = [
    Text('Home'),
    Text('Chart'),
    Text('Dashboard'),
    Text('Settings')
  ];
  final widgetOptions = [
    BeerListPage(),
//    PlacesPage(),
    HistoryListPage(),
    DashboardPage(),
    SettingsPage()
  ];
//  var apptiltlebar = Text('Home');

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.deepPurple,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.black))), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
            new BottomNavigationBarItem(icon: new Icon(Icons.table_chart), title: new Text("Chart")),
            new BottomNavigationBarItem(icon: new Icon(Icons.dashboard), title: new Text("Dashboard")),
            new BottomNavigationBarItem(icon: new Icon(Icons.settings), title: new Text("Settings"))
          ],
        ),

      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
//      apptiltlebar = widgetOptions[index];
    });
  }
}