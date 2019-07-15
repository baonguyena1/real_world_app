import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_world_app/controllers/detail_page.dart';
import './views/video_cell.dart';

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
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('REAL WORLD APP'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                print('Reloading...');
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },
            )
          ],
        ),
        body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.videos != null ? this.videos.length : 0,
                  itemBuilder: (context, i) {
                    final video = this.videos[i];
                    return new FlatButton(
                      padding: new EdgeInsets.all(0.0),
                      child: new VideoCell(video),
                      onPressed: () {
                        print('Tapped at $i');
                        Navigator.push(context, 
                          new MaterialPageRoute(
                            builder: (context) => new DetailPage(video)
                          )
                        );
                      }
                    );
                  },
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}