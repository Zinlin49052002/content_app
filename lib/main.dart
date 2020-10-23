import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  List<int> bottom = [0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: CustomScrollView(
          center: centerKey,
          slivers: <Widget>[

            SliverList(
              key: centerKey,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      height: 150,
                      color: Colors.white,
                      child: Card(
                        elevation:10 ,
                        shadowColor: Colors.black,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),

                        color: Colors.teal,
                        margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 30.0),
                        child: Text('Item: ${bottom[index]}'),

                      ),
                    ),
                  );
                },
                childCount: bottom.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar:BottomNavigationBar(

          type: BottomNavigationBarType.fixed ,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm,color: Color.fromARGB(255, 0, 0, 0)),
                title: new Text('Home')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_sharp,color: Color.fromARGB(255, 0, 0, 0)),
                title: new Text('Power')
            )
          ],


        ) ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new FloatingActionButton(

          onPressed:(){
            setState(() {
              // top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
          },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),


      ),
    );
  }
}

