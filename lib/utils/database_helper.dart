import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/money.dart';


class DatabaseHelper {
  
	static DatabaseHelper _databaseHelper;  
	static Database _database; 

  String moneyTable = 'money_table';
  String colId = 'id';
  String colTitle = 'title';
  String colAmount = 'amount';
  String colDate = 'date';
  
  DatabaseHelper._createInstance();   //Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}


  //Check if database is not yet initialize then call the initialization
  Future<Database> get database async{
    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  //function to initialize database
  Future<Database> initializeDatabase() async{

    //get the directory path for both android and ios to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'money.db';

    //open/create the database at a given path
    var moneyDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return moneyDatabase ;
  }

  //Create Database
  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $moneyTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle Text, $colAmount INTEGER, $colDate TEXT)');
  }

  
  //Insert Operation: INsert a money object to database
  Future<int> insertMoney(Money money) async{
    Database db = await this.database;
    var result = await db.insert(moneyTable, money.toMap());
    return result;
  }

  //Fetch Operation: Get all money object from database
  Future<List<Map<String, dynamic>>> getMoneyMapList() async{
    Database db = await this.database;

    var result = await db.query(moneyTable);
    return result;
  }



  Future<List<Money>> getMoneyList() async{
    
    var moneyMapList = await getMoneyMapList();
    int count = moneyMapList.length;

    List<Money> moneyList = List<Money>();
    for (int i= 0; i< count; i++){
      moneyList.add(Money.fromMapObject(moneyMapList[i]));
    }

    return moneyList;
  }


}