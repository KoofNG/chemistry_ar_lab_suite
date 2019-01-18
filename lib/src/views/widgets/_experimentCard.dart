import 'package:flutter/material.dart';

class ExperimentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('9.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 12.5,
                      left: 10.0,
                      child: Text(
                        'Titration',
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
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.0),                        
                        child: Text(
                          'is the slow addition of a know concentration (called a titrant) to a known volume of another solution of unknown concentration until the reaction reaches neutralization, which is often indicated by a color change.',
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
                              onPressed: () => null,
                              color: Colors.lightBlue,
                              child: Text(
                                'START',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                )
                              ),
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
        ),
      ),
    );
  }
}
