import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  final course;

  CourseInfo(this.course);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      new Row(children: <Widget>[
        Expanded(
          child: new Image.network(this.course['imageUrl']),
          flex: 1,
        ),
        Expanded(child: new CourseGeneralInfo(this.course), flex: 2)
      ],),
      new Divider(),
    ]);
  }
}

class CourseGeneralInfo extends StatelessWidget {
  final course;

  CourseGeneralInfo(this.course);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(course['name'], style: new TextStyle(fontSize: 16.0)),
        new Text(
          course['duration'],
          style: new TextStyle(fontStyle: FontStyle.italic),
        ),
        new Text(
          'Episode #${course['number']}',
          style: new TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
