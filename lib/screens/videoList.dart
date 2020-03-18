import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
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