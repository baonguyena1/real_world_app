import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RealWoldState();
  }
}

class _RealWoldState extends State<RealWorldApp> {
  var _isLoading = true;

  _fetchData() {
    print('Attempting fetch data from network');
    final url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
    final response = http.get(url);
    print(response);
  }

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
              _fetchData();
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