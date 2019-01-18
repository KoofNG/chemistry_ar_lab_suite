import 'package:flutter/material.dart';

class ExperimentGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* var _size = MediaQuery.of(context).size;
    final double _itemHeight = (_size.height + 20.0);
    final double _itemWidth = (_size.width / 2);
    double _deviceWidth = MediaQuery.of(context).size.width;
    print(_itemHeight);
    print(_itemWidth);
    print(_itemWidth / _itemHeight); */
    return Container(
      child: Center(
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
                  height: 130.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('8.jpeg'),
                      fit: BoxFit.cover,
                    )
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
