import 'package:flutter/material.dart';

import 'package:chemistry_ar_lab_suite/src/views/labOne.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExperimentStarted = false;

  int choiceExperiment;
  List experiments = [];

  void populateExperimentArray() {
    setState(() {
      experiments = [
        {
          'id': 1,
          'title': 'Titration',
          'description':
              'To find out how much of a particular substance is in a liquid by measuring how much of another substance is needed to react with it ',
          'imageName': '9.jpg'
        },
        {
          'id': 2,
          'title': 'Electrolysis',
          'description':
              'The separation of a liquid(electrolyte) into its chemical parts by passing an electric current through it',
          'imageName': '5.jpeg'
        },
        {
          'id': 3,
          'title': 'Neutralization',
          'description': 'To make a substance neutral',
          'imageName': '7.jpeg'
        },
        {
          'id': 4,
          'title': 'Combustion',
          'description':
              'Chemical process in which substances combine with the oxygen in the air to produce heat and light',
          'imageName': '2.png'
        },
      ];
    });
  }

  void initState() {
    super.initState();
    populateExperimentArray();
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _deviceWidth,
      height: _deviceHeight,
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _deviceWidth * 0.5,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              child: _isExperimentStarted
                  ? _buildStartExperiment(
                      choiceExperiment,
                      experiments[choiceExperiment]['title'],
                      experiments[choiceExperiment]['description'],
                      experiments[choiceExperiment]['imageName'])
                  : _buildChooseExperiment(),
            ),
            Container(
              width: _deviceWidth * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: _buildGridExperimentLayout(),
            )
          ],
        ),
      ),
    );
  }

  /* Card to show experiments */
  Widget _cardExperiment(
      int id, String imageName, String description, String title) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageName),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: Text(
                    description,
                    style: TextStyle(
                      background: Paint(),
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Card to show the choice experiment */
  Widget _buildStartExperiment(
      int id, String title, String description, String imageName) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageName),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 12.5,
                  left: 10.0,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      description + '.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetLabOne()));
                          },
                          color: Colors.lightBlue,
                          child: Text('START',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Grid Layout of available experiments */
  Widget _buildGridExperimentLayout() {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: experiments.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          Map experiment = experiments[index];
          return InkWell(
            //onTap: chooseExperiment,
            onTap: () {
              choiceExperiment = experiment['id'] - 1;
              setState(() {
                _isExperimentStarted = true;
              });
            },
            child: _cardExperiment(experiment['id'], experiment['imageName'],
                experiment['title'], experiment['description']),
          );
        },
      ),
    );
  }

  /* Text displaying show Text */
  Widget _buildChooseExperiment() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
      ),
      child: Text('Choose Experiment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
