import 'package:flutter/material.dart';
import '../components/footer.dart';
import '../components/footer.dart';
import './add_screen.dart';
import './history_screen.dart';
import './dashboard_screen.dart';
// import 'package:appchallenge_1_cashflow/pages/add_screen.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 2);
  }
  

  @override
  Widget build(BuildContext context) {

    //to get the current width of the screen
    final MediaQueryData = MediaQuery.of(context);
    final size=MediaQueryData.size.width;

    return Scaffold(
      backgroundColor: Colors.amber,
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
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new DashboardScreen(),
          new HistoryScreen(),
          // new HistoryScreen()
          // new AddScreen(),
 
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context)=>AlertDialog(
              title: new Text('Add Record'),
              content: new AddScreen(),
            )
          );
        }
      ),
      bottomNavigationBar: FooterComponent(),
    );
  }
}

