import 'package:flutter/material.dart';

class SetLabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;

    Widget _instrumentCard() {
      return Card(
        margin: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Text(
                  'Beaker',
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

    return Container(
      width: _deviceWidth,
      height: _deviceHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AlertDialog(
            title: new Text('Rewind and remember'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('You will never be satisfied.'),
                  new Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Regret'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          /* Navbar */
          Container(
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
                    onPressed: () => null,
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
              ],
            ),
          ),
          /* Body */
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: GridView.count(
                      padding: EdgeInsets.all(0.0),
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      children: <Widget>[
                        _instrumentCard(),
                        _instrumentCard(),
                        _instrumentCard(),
                        _instrumentCard(),
                        _instrumentCard(),
                        _instrumentCard(),
                      ],
                    ),
                  ),

                  /* Card Showing instruments added */
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'You have picked',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0.0),
                                children: <Widget>[
                                  ListTile(
                                    contentPadding: EdgeInsets.all(1.0),
                                    title: Text(
                                      'Burette',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '1 pieces',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(1.0),
                                    title: Text(
                                      'Burette',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '1 pieces',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
}
