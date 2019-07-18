import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            _TitleSection(),
            _ButtonRow(),
            _TextSection()
          ],
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _TitleSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500]
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41')
        ],
      ),
    );
  }
}

class _ButtonRow extends StatelessWidget {

  Column _buildButtonColumn(Color color, IconData icon, String content) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'NEAR ME'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }
}

class _TextSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
        ),
    );
  }
}