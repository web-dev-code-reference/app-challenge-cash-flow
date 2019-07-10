import 'package:flutter/material.dart';


class FooterComponent extends StatefulWidget {
  @override
  _FooterComponentState createState() => _FooterComponentState();
}

class _FooterComponentState extends State<FooterComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: new Text('Income', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),),
              subtitle: new Text('\$230', style: TextStyle(color:Colors.white,),),
            ),
          ),
          Expanded(
            child: ListTile(
              title: new Text('Expense', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),),
              subtitle: new Text('\$230', style: TextStyle(color:Colors.white,),),
            ),
          ),
          Expanded(
            child: ListTile(
              title: new Text('Balance', style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold)),
              subtitle: new Text(
                "\$230", style: TextStyle(color: Colors.white),),
            ),
          ),
          
        ],
      ),
      
    );
  }
}