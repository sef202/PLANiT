import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new ClassPage(),
    routes: <String, WidgetBuilder> {
      "/AddClassPage": (BuildContext context) => new AddClassPage(),
    }
  ));
}


class ClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Classes'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add), onPressed: () {
                  Navigator.of(context).pushNamed("/AddClassPage");
            })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(70.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              alignment: Alignment.center,
              child: Text(
                'POSC 100',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(70.0),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              alignment: Alignment.center,
              child: Text(
                  'CPSC 471',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
              ),
            ),
          ]
        ),
    );
  }
}

class AddClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Add class'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
    );
  }
}