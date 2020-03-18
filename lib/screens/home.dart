import 'package:flutter/material.dart';
import 'package:rutorrent/models/addedTorrents.dart';
import 'package:rutorrent/screens/musicList.dart';
import 'package:rutorrent/screens/settings.dart';
import 'package:rutorrent/screens/torrentList.dart';
import 'package:rutorrent/screens/videoList.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AddedTorrents newTorrent;
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Torrents(),
    Settings(),
    Music(),
    Video(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Torrents(); // Our first view in viewport
  String name='';

  //Alert dailog for adding a torent link
   void showAdd(){
    AlertDialog dialog = AlertDialog(
      title: Text('Add Torrent Link'),
      content: Container(
        height: 50,
        child: TextField(
          onChanged: (val){
            name=val;
          },
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey)
            )
          ),
        ),
      ),
      actions: [
        FlatButton(child: Text('Cancel'),onPressed: (){Navigator.pop(context);},),
        FlatButton(child: Text('Add'),onPressed: (){
          setState(() {
              newTorrent=AddedTorrents(name,0,990.67);
              currentScreen = Torrents(newTorrent: newTorrent,);
              currentTab=0;
              print(newTorrent);
            }  
          );
          Navigator.of(context).pop();
        },)
      ]
    );
    showDialog(context: context,child: dialog,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //Add widget over Torrents
        onPressed:(){
         showAdd();
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        
                        currentScreen =
                            Torrents(newTorrent: newTorrent,); 
                        currentTab = 0;
                        print("torrent is $newTorrent");
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.list,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Torrents',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Settings(); 
                        currentTab = 1;
                        print("settings torrent is $newTorrent");
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Music(); 
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.music_note,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Music',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Video(); 
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.video_label,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Video',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}