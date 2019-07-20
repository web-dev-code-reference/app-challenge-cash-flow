import 'dart:async';
import 'package:flutter/material.dart';
import '../models/money.dart';
import '../utils/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';






class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Money> moneyList;
  int count = 0;


  @override
  Widget build(BuildContext context) {

    if (moneyList == null){
      moneyList = List<Money>();
      updateListView();
    }

    return Container(
      child: getNoteListView(),
    );
  }


ListView getNoteListView() {

		TextStyle titleStyle = Theme.of(context).textTheme.subhead;

		return ListView.builder(
			itemCount: count,
			itemBuilder: (BuildContext context, int position) {
				return Card(
					color: Colors.white,
					elevation: 2.0,
					child: ListTile(

						// leading: CircleAvatar(
						// 	backgroundColor: getPriorityColor(this.noteList[position].priority),
						// 	child: getPriorityIcon(this.noteList[position].priority),
						// ),

						title: Text(this.moneyList[position].title, style: titleStyle,),

						subtitle: Text(this.moneyList[position].date),

						trailing: GestureDetector(
							child: Icon(Icons.delete, color: Colors.grey,),
							onTap: () {
								// _delete(context, moneyList[position]);
							},
						),


						onTap: () {
							debugPrint("ListTile Tapped");
							// navigateToDetail(this.moneyList[position],'Edit Note');
						},

					),
				);
			},
		);
  }




  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){

      Future<List<Money>> moneyListFuture = databaseHelper.getMoneyList();

      moneyListFuture.then((noteList){
        setState(() {
         this.moneyList = moneyList;
         this.count = moneyList.length; 
        });
      });
    });
  }

}




