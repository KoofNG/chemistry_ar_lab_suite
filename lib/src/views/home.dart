import 'package:flutter/material.dart';

import 'package:chemistry_ar_lab_suite/src/views/widgets/_experimentCard.dart';
import 'package:chemistry_ar_lab_suite/src/views/widgets/_experimentsGrid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _deviceWidth,
      height: _deviceHeight,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: _RowWidget(),
    );
  }
}

class _RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ExperimentCard(),
        ),
        Expanded(
          child: ExperimentGrid(),
        ),
      ],
    );
  }
}
