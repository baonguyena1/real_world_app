import 'package:flutter/material.dart';
import 'dart:convert';
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
  var videos;

  _fetchData() async {
    print('Attempting fetch data from network');
    final url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final videosJson = map['videos'];
      setState(() {
        this.videos = videosJson;
        _isLoading = false;
      });
    }
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
          child: _isLoading ? new CircularProgressIndicator() : 
          new ListView.builder(
            itemCount: this.videos != null ? this.videos.length : 0,
            itemBuilder: (context, i) {
              final video = this.videos[i];
              return new VideoCell(video);
            },
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VideoCell extends StatelessWidget {
  final video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(video['imageUrl']),
              new Container(height: 8.0),
              new Text(video['name'],
                style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
  
}