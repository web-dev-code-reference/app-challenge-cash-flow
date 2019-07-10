import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/money.dart';

class DataBaseHelper{
  static DatabaseHelper _databaseHelper; //Singleton DatabaseHelper
  static Database _database;

  String moneyTable = 'money_table';
  String colId = 'id';
  String colTitle = 'title';
  String colAmount = 'amount';
  String colDate = 'date';
  
  DataBaseHelper._createInstance();

  factory DatabaseHelper(){
    if (_databaseHelper == null){
      _databaseHelper = DataBaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if (_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initilizeDatabase() async{
    //get the directory path for both android and ios to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'money.db';
  }

  



}