import 'package:flutter/material.dart';

class SetLabTwo extends StatefulWidget {
  @override
  _SetLabTwo createState() => _SetLabTwo();
}

class _SetLabTwo extends State<SetLabTwo> {
  bool chooseSubstance = false;

  List choosenSub = [];

  List chemicals = [];
  void populateChemicalArray() {
    setState(() {
      chemicals = [
        {'id': 1, 'title': 'Hcl'},
        {'id': 2, 'title': 'Na2Co3'},
        {'id': 3, 'title': 'NaCl'},
      ];
    });
  }

  void initState() {
    super.initState();
    populateChemicalArray();
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
            _navigationBar(),
            _mainBody(),
          ],
        ),
      ),
    );
  }

  /* Navbar */
  Widget _navigationBar() {
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
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'Tap to add',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: RichText(
              textAlign: TextAlign.start,
              text: new TextSpan(
                text: '2',
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
        ],
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _gridLayoutOfChemicals(),
            chooseSubstance ? _addedSubstances() : _infoBar(),
          ],
        ),
      ),
    );
  }

  /* Card for added Substances */
  Widget _addedSubstances() {
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
          itemCount: choosenSub.length,
          itemBuilder: (BuildContext context, index) {
            Map pickedSub = choosenSub[index];
            return Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: _listTile(pickedSub['title']),
            );
          },
        ),
      ),
    );
  }

  /* Each Tile */
  Widget _listTile(String title) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /* Chemical Cards */
  Widget _chemicalCards(String title) {
    return Card(
      margin: EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('6.jpeg'),
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

  /* Grid Layout of Chemicals */
  Widget _gridLayoutOfChemicals() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: GridView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: chemicals.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          Map subs = chemicals[index];
          return InkWell(
            onTap: () {
              choosenSub.add(subs);
              setState(() {
                chooseSubstance = true;
              });
            },
            child: _chemicalCards(subs['title']),
          );
        },
      ),
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
      child: Text('Choose your Chemicals',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
