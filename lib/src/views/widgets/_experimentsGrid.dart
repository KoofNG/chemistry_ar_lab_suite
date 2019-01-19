import 'package:flutter/material.dart';

class ExperimentGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: _cardExperiment(),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: _cardExperiment(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: _cardExperiment(),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: _cardExperiment(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardExperiment() {
    return Container(
      child: GestureDetector(
        onTap: () => null,
        child: Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('8.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Text(
                          'Titration',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*child: Center(
    child: GridView.count(
      padding: EdgeInsets.all(0.0),
      primary: false,
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      childAspectRatio: (0.70),
      children: <Widget>[
        _cardExperiment(),
        _cardExperiment(),
        _cardExperiment(),
        _cardExperiment(),
      ],
    ),
  ), */
