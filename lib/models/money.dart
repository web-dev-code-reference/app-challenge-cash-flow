class Money{

int _id;
String _title;
int _amount;
String _date;

//Constructors
Money(
  this._title, 
  this._amount
);

Money.withId(
  this._id, 
  this._title, 
  this._amount, 
  this._date
);


//getter
int get id => _id;
String get title => _title;
int get amount => _amount;
String get date => _date;


//setters
set title(String newTitle){
  if (newTitle.length <=255){
    this._title = newTitle;
  }
}

set amount(int newAmount){
  this._amount = newAmount;
}

set date(String newDate){
  this._date=newDate;
}


//Convert a Money Object to Map Object
Map<String, dynamic> toMap(){
  var map = Map<String, dynamic>();
  if (id !=null){
    map['id'] = id;
  }
  map['title'] = _title;
  map['amount'] = _amount;
  map['date'] = _date;
} 


//convert Map Object  to Money Object
Money.fromMapObject(Map<String, dynamic> map){
  this._id = map['id'];
  this._title = map['title'];
  this._amount = map['amount'];
  this._date = map['date'];
}



}