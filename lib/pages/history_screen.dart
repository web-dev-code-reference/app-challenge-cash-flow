import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../models/money.dart';
import '../utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';





class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Money> moneyList;
  int count = 0;
  // updateListView();

  @override
  Widget build(BuildContext context) {

    if (moneyList == null){
      moneyList=List<Money>();
      updateListView();
    }
    // return getMoneylistView();
      return  getMoneylistView();
      updateListView();
      // return  Text('$debugPrint()');
      // return  print(debugPrint())
    //  return Text('$moneyList');
    //  log(' dsdsd $moneyList');
      
    
  }

  ListView getMoneylistView(){
  // TextStyle TitleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        var row_position = position + 1;
        return Card(
          child: ListTile(
          leading: CircleAvatar(child: Text('$row_position'),),
          title: Text('Exp - ' + this.moneyList[position].title , ),
          // trailing: Text('P '+this.moneyList[position].amount.toString(), ),
          subtitle: Text( 'P' +  this.moneyList[position].amount.toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 60,
                child: Text('P '+this.moneyList[position].amount.toString(),textAlign: TextAlign.left, ),
              ),
              
       
              GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey,),
                onTap: (){
                  _delete(context, moneyList[position]);
                },
              ),
            ],
          ),
          // subtitle: Text(this.moneyList[position].title, ),

          // title: Text('fdf' ),
        ),);
      },
    );
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Money>> moneyListfuture = databaseHelper.getMoneyList();
      moneyListfuture.then((moneyList) {
        setState(() {
        this.moneyList = moneyList;
        this.count = moneyList.length; 
        });
      });
    });
  }

  _delete(BuildContext context, Money money) async{
    int result = await databaseHelper.deleteMoney(money.id);
    if (result !=0){
      _showsnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }

  }

  _showsnackBar(BuildContext context, String message){
    final SnackBar = prefix0.SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(SnackBar);
  }

}


