import 'package:flutter/material.dart';


class AppbarComponent extends StatefulWidget {
  @override
  _AppbarComponentState createState() => _AppbarComponentState();
}

class _AppbarComponentState extends State<AppbarComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Cash Flow Manager'),
        backgroundColor: Colors.black,
        // bottom: new Text(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context)=>AlertDialog(
                  title: new Text('Settings'),
                  content: new Container(
                    //update this later
                   child: new Text('fdfd'),
                  ),

                ),
              );
            },
          )
        ],
          
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.graphic_eq)),
            new Tab(text: 'History'),
            // new Tab(text: 'Add Record'),
          ],
        ),  

      ),
      
    );
  }
}