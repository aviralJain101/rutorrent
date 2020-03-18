import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search for a Setting',
            onPressed: () {
            },
          ),
        ] 
      ),
       drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("About Us"),
              trailing: Icon(Icons.arrow_forward),
            ),
            Divider(height: 3,),
             ListTile(
              title: Text("Exit"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}