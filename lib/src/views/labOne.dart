import 'package:flutter/material.dart';

import 'package:chemistry_ar_lab_suite/src/views/labTwo.dart';

class SetLabOne extends StatefulWidget {
  @override
  _SetLabState createState() => _SetLabState();
}

class _SetLabState extends State<SetLabOne> {
  bool chooseInstruments = false;
  bool isProceed = true;
  int choosenID;

  Map pickedApparatus;
  List choosenApparatus = [];

  List apparatus = [];
  void populateApparatusArray() {
    setState(() {
      apparatus = [
        {'id': 1, 'counter': 1, 'title': 'Beaker', 'imageName': '9.jpg'},
        {
          'id': 2,
          'counter': 1,
          'title': 'Conical Flask',
          'imageName': '5.jpeg'
        },
        {'id': 3, 'counter': 1, 'title': 'Pipette', 'imageName': '9.jpg'},
        {
          'id': 4,
          'counter': 1,
          'title': 'Cylindrical Flask',
          'imageName': '5.jpeg'
        },
        {'id': 5, 'counter': 1, 'title': 'Burette', 'imageName': '9.jpg'},
        {'id': 6, 'counter': 1, 'title': 'Litmus Paper', 'imageName': '5.jpeg'},
      ];
    });
  }

  void initState() {
    super.initState();
    populateApparatusArray();
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        width: _deviceWidth,
        height: _deviceHeight,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("1.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /* Navbar */
            _navigatonBar(),
            /* Body */
            _mainBody(),
          ],
        ),
      ),
    );
  }

  /* Main Body */
  Widget _mainBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _gridLayoutOfInstruments(),
            chooseInstruments ? _addedInstruments() : _infoBar(),
          ],
        ),
      ),
    );
  }

  /* Navigation Bar */
  Widget _navigatonBar() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(top: 24.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50.0,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(0.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'SET UP YOUR LAB',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Tap to add',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: RichText(
              textAlign: TextAlign.start,
              text: new TextSpan(
                text: '1',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: '/2',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isProceed
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 175.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SetLabTwo()));
                    },
                    child: Text(
                      'Procced',
                    ),
                  ),
                )
        ],
      ),
    );
  }

  
  /* Instrument Card */
  Widget _instrumentCard(int counter, String title, String imageName) {
    return Card(
      margin: EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageName),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  )),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Grid layouts of Instruments */
  Widget _gridLayoutOfInstruments() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: GridView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: apparatus.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            Map instrument = apparatus[index];
            return InkWell(
              onTap: () {
                choosenID = instrument['id'];
                if (choosenApparatus.contains(instrument)) {
                  instrument['counter'] += 1;
                } else {
                  choosenApparatus.add(instrument);
                }
                setState(() {
                  if (choosenApparatus.length != 0) {
                    isProceed = false;
                  }
                  chooseInstruments = true;
                });
              },
              child: _instrumentCard(instrument['counter'], instrument['title'],
                  instrument['imageName']),
            );
          }),
    );
  }

  /* Information Bar */
  Widget _infoBar() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
      ),
      child: Text('Choose your Instruments',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  /* Instruments Added */
  Widget _addedInstruments() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          padding: new EdgeInsets.all(0.0),
          //itemExtent: 50,
          itemCount: choosenApparatus.length,
          itemBuilder: (BuildContext context, index) {
            pickedApparatus = choosenApparatus[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: _listTile(
                  pickedApparatus['counter'], pickedApparatus['title']),
            );
          },
        ),
      ),
    );
  }

  /* ListTile View */
  Widget _listTile(int counter, String apparatusName) {
    var c = counter.toString();
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0),
      title: Text(
        apparatusName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        c + ' piece',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
