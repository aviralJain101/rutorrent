import 'package:flutter/material.dart';
import 'package:rutorrent/models/addedTorrents.dart';


class Torrents extends StatefulWidget {
  final AddedTorrents newTorrent;

  Torrents({Key key, this.newTorrent}) : super(key: key);
  @override
  _TorrentsState createState() => _TorrentsState(newTorrent);
}

class _TorrentsState extends State<Torrents> {
  AddedTorrents newTorrent;
  _TorrentsState(this.newTorrent);
  List<AddedTorrents> torrentsList = [
    AddedTorrents('October Sky 720p',420.20,800.00),
    AddedTorrents('Interstellar 720p',570.48,980.30),
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      if(newTorrent!=null){
      torrentsList.add(newTorrent);
      print(torrentsList.length);
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Torrents'),
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
      body: ListView.builder(
        itemCount: torrentsList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10,left: 10,right: 10),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(torrentsList[index].name[0]),
                ),
                title: Text(torrentsList[index].name),
                subtitle: Text('${torrentsList[index].downloaded} MB / ${torrentsList[index].totalSize} MB'),
              ),
            ),
          );
        },
      ),
    );
  }
}