import 'package:flutter/material.dart';

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RealWoldState();
  }
}

class _RealWoldState extends State<RealWorldApp> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('REAL WORLD APP'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.refresh),
            onPressed: () {
              print('Reloading...');
              setState(() {
                _isLoading = false;
              });
            },)
          ],
        ),
        body: new Center(
          child: _isLoading ? new CircularProgressIndicator() : new Text('Finished loading...'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}