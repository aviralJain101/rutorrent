import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
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