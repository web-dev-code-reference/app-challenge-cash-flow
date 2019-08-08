// import 'dart:async';
import 'package:flutter/material.dart';
import '../models/money.dart';
import '../utils/database_helper.dart';
import 'package:intl/intl.dart';
// import 'dart:developer';

class AddScreen extends StatefulWidget {

	final String appBarTitle;
	final Money money;

	AddScreen(this. money, this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return AddScreenState(this.money, this.appBarTitle);
  }
}

class AddScreenState extends State<AddScreen> {

	static var _priorities = ['High', 'Low'];

	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
	Money money;
	

	TextEditingController titleController = TextEditingController();
	// TextEditingController descriptionController = TextEditingController();
	TextEditingController amountController = TextEditingController();

	AddScreenState(this.money, this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.title;

		titleController.text = money.title;
		amountController.text = money.amount.toString();
		// descriptionController.text = money.description;

    return WillPopScope(

	    onWillPop: (){
	    	// Write some code to control things, when user press Back navigation button in device navigationBar
		    moveToLastScreen();
	    },

	    child: Scaffold(
	    appBar: AppBar(
		    title: Text(appBarTitle),
		    leading: IconButton(icon: Icon(
				    Icons.arrow_back),
				    onPressed: () {
		    	    // Write some code to control things, when user press back button in AppBar
		    	    moveToLastScreen();
				    }
		    ),
	    ),

	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[

			    	// First element
				    // ListTile(
					  //   title: DropdownButton(
						// 	    items: _priorities.map((String dropDownStringItem) {
						// 	    	return DropdownMenuItem<String> (
						// 			    value: dropDownStringItem,
						// 			    child: Text(dropDownStringItem),
						// 		    );
						// 	    }).toList(),

						// 	    style: textStyle,

						// 	    // value: getPriorityAsString(money.priority),

						// 	    onChanged: (valueSelectedByUser) {
						// 	    	setState(() {
						// 	    	  debugPrint('User selected $valueSelectedByUser');
						// 	    	  // updatePriorityAsInt(valueSelectedByUser);
						// 	    	});
						// 	    }
					  //   ),
				    // ),

				    // Second Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: titleController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
						    	updateTitle();
						    },
						    decoration: InputDecoration(
							    labelText: 'Title',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),

				    // Third Element
				    // Padding(
					  //   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					  //   child: TextField(
						//     controller: descriptionController,
						//     style: textStyle,
						//     onChanged: (value) {
						// 	    debugPrint('Something changed in Description Text Field');
						// 	    // updateDescription();
						//     },
						//     decoration: InputDecoration(
						// 		    labelText: 'Description',
						// 		    labelStyle: textStyle,
						// 		    border: OutlineInputBorder(
						// 				    borderRadius: BorderRadius.circular(5.0)
						// 		    )
						//     ),
					  //   ),
				    // ),
				    // Third Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: amountController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    // updateDescription();
							    updateAmount();
						    },
						    decoration: InputDecoration(
								    labelText: 'Amount',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),

				    // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Save button clicked");
									    	  _save();
									    	});
									    },
								    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Delete',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
										    setState(() {
											    debugPrint("Delete button clicked");
											    // _delete();
										    });
									    },
								    ),
							    ),

						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    ));
  }

  void moveToLastScreen() {
		Navigator.pop(context, true);
  }

	// Convert the String priority in the form of integer before saving it to Database
	// void updatePriorityAsInt(String value) {
	// 	switch (value) {
	// 		case 'High':
	// 			money.priority = 1;
	// 			break;
	// 		case 'Low':
	// 			money.priority = 2;
	// 			break;
	// 	}
	// }

	// Convert int priority to String priority and display it to user in DropDown
	String getPriorityAsString(int value) {
		String priority;
		switch (value) {
			case 1:
				priority = _priorities[0];  // 'High'
				break;
			case 2:
				priority = _priorities[1];  // 'Low'
				break;
		}
		return priority;
	}

	// Update the title of money object
  void updateTitle(){
    money.title = titleController.text;
  }

	// Update the amount of money object
	void updateAmount() {
  
		money.amount = int.parse(amountController.text) ;
	}

	// Save data to database
	void _save() async {

		moveToLastScreen();

		money.date = DateFormat.yMMMd().format(DateTime.now());
		int result;
		if (money.id != null) {  // Case 1: Update operation
			// result = await helper.updateMoney(money);
		} else { // Case 2: Insert Operation
			result = await helper.insertMoney(money);
      // var testresult=money;
      // log('$result[1]');
      
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'money Saved Successfully');
      

		} else {  // Failure m
			_showAlertDialog('Status', 'Problem Saving money');
		}

	}


	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}










