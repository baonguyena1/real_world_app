import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:real_world_app/views/course_info.dart';

class DetailPage extends StatefulWidget {
  final video;

  DetailPage(this.video);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState(this.video);
  }
}

class _DetailPageState extends State<DetailPage> {
  final video;
  var _isLoading = false;
  var _courses;

  _DetailPageState(this.video);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Detail Page'),
      ),
      body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: _courses.length != null ? _courses.length : 0,
                  itemBuilder: (context, i) {
                    final course = _courses[i];
                    return new CourseInfo(course);
                  },
                )),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    _fetchData();
  }

  _fetchData() async {
    final videoId = this.video['id'];
    final url =
        'https://api.letsbuildthatapp.com/youtube/course_detail?id=$videoId';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final courses = map;
      _courses = courses;
      setState(() {
        _isLoading = false;
      });
    }
  }
}
