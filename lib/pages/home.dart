import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    //to get the current width of the screen
    final MediaQueryData = MediaQuery.of(context);
    final size=MediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: new Text('CashFlow Manager'),
        backgroundColor: Colors.black,
        elevation: 1.0,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.add), onPressed: (){
              showDialog(
                context: context,
                builder: (context)=> new AlertDialog(
                  title: new Text('Addd'),
                  content: new Container(
                    height: 170.0,
                    
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}